Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [178.154.239.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C513BC35
	for <linux-sound@vger.kernel.org>; Wed, 27 Nov 2024 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732731069; cv=none; b=GWf55sIK9Fd6HTV5hRkoSK0QQUb0rGupROUrem01aqlJ2gKKeUWcTnQtzCVyBaC3J4oBTNDLKHER9VVtCm+GR7wezRydiWoYjh0kusra8GGoeFH4gb1Rd9ScqYzQ5Em+4G5X7nSLz3xv7WbtQc8RZJvGrMW3fNzzqMKUkv4zIGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732731069; c=relaxed/simple;
	bh=jEigK9SZPqo3/i2DgM8qw2UM/Yut0z6eMn8LlQ7PVUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WPNxg+cePrgUtGWRuGrA1bU46TULAa4qhzCq9BPyFzeLt4B+OT2GtmD8/D3nsIBMcqGaoFUeyKM9UKVr5nXVW8ypDKco5Lamv5GDy7xEJoN3NffHnIJvIi91z6Sfps0pkR5JQssEVdCk1Zf4X1vss0MZ19mhT5vtBqns4LtMQio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=OgfzAKEE; arc=none smtp.client-ip=178.154.239.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="OgfzAKEE"
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:26a5:0:640:547b:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id DA14760939;
	Wed, 27 Nov 2024 21:10:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id sAeMOV0OjmI0-0JarFRzv;
	Wed, 27 Nov 2024 21:10:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1732731055; bh=nbKPS/GAzOMszolv8HcguSymvsdNQMfAD4PQqb0uIlE=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=OgfzAKEEyyhNAE1G1+BEQiGBVMIcJMNHWmq/L/1cuE1yrkq84xSJhgSpaKVA1ig9l
	 eWx7QE7MG9TwGUeLepADk3Jhu7ws6ewLNPW+Xj7CUFFgJ7EoUVUw6/Gxca55pap/GR
	 WXsIAAyRLxJtYsuxRTjDbC7kI2nkKeNigpEZ9g3s=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Brent Lu <brent.lu@intel.com>
Cc: linux-sound@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2] SOF: Intel: hda: fix memory leak in hda_machine_select()
Date: Wed, 27 Nov 2024 21:10:53 +0300
Message-ID: <20241127181053.972566-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel memory leak detector has reported the following leak:

unreferenced object 0xffff88810f54bed0 (size 16):
  comm "kworker/18:1", pid 162, jiffies 4294754593
  hex dump (first 16 bytes):
    73 6f 66 2d 68 64 61 2d 67 65 6e 65 72 69 63 00  sof-hda-generic.
  backtrace (crc 4bf1675c):
    [<00000000c0f2b5a4>] __kmalloc_node_track_caller_noprof+0x349/0x610
    [<000000008c0a621c>] kstrdup+0x3d/0x70
    [<0000000036666329>] hda_machine_select+0xbe0/0x1e60 [snd_sof_intel_hda_generic]
    [<00000000f9312d18>] sof_probe_work+0x192/0x1bc0 [snd_sof]
    [<00000000e86720cf>] process_scheduled_works+0x7ab/0xe80
    [<000000006ac5a4f7>] worker_thread+0x9b2/0xda0
    [<00000000bb5178a6>] kthread+0x260/0x310
    [<0000000045bf5f63>] ret_from_fork+0x45/0x80
    [<0000000064567ca7>] ret_from_fork_asm+0x1a/0x30

This happens when kstrdup()'ed area returned by 'remove_file_ext()' becomes
unreferenced after assigning new value to 'sof_pdata->tplg_filename'. Since
an explicit management of this area with 'kfree()' may be annoying and
error-prone, tweak 'remove_file_ext()' to use 'devm_kstrdup()' (and so
use memory which is automatically freed on driver detach).

Fixes: 85b66359c5a7 ("ASoC: SOF: Intel: hda: refactoring topology name fixup for SDW mach")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: use convenient devm_kstrdup()
---
 sound/soc/sof/intel/hda.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 01b135068b1f..90b853b274e9 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1197,11 +1197,11 @@ static int check_tplg_quirk_mask(struct snd_soc_acpi_mach *mach)
 	return 0;
 }
 
-static char *remove_file_ext(const char *tplg_filename)
+static char *remove_file_ext(struct device *dev, const char *tplg_filename)
 {
 	char *filename, *tmp;
 
-	filename = kstrdup(tplg_filename, GFP_KERNEL);
+	filename = devm_kstrdup(dev, tplg_filename, GFP_KERNEL);
 	if (!filename)
 		return NULL;
 
@@ -1285,7 +1285,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		 */
 		if (!sof_pdata->tplg_filename) {
 			/* remove file extension if it exists */
-			tplg_filename = remove_file_ext(mach->sof_tplg_filename);
+			tplg_filename = remove_file_ext(sdev->dev, mach->sof_tplg_filename);
 			if (!tplg_filename)
 				return NULL;
 
-- 
2.47.0

