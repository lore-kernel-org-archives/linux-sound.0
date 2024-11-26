Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [178.154.239.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA27A1D5ABD
	for <linux-sound@vger.kernel.org>; Tue, 26 Nov 2024 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732632166; cv=none; b=DhrU1S9VV/pjEo0RQ5hgdZI9Zxx5UWT03PzUnmC85haib06UoY+F8EZdy9EFZyaiNDIrTU3wIBosvJLECMqfJ8h3ruEIYiASFwdfR48JuMa7NpxBZrr5AUtc+MhkM7ULG2rkC+SqHgG/juH9Y4NWdNiRm6Ct6P+hMkpdd+H5W5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732632166; c=relaxed/simple;
	bh=4U+RbTjv/1IMjKTIYKTLn4fKyd2E5uzbDW7GxkmMkgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYqAg26tqHJMrpyoBfLRs/6e6HGGRjGz8X8572h7judzuCgEJXjDcaEj02mr+KSbzEQ43Kk5WLuLQjeEFbcftOSzUDtpiPy+UKY0WQR0NDQ+a3T/iuLJWZTd6azqRLz0yGP8fFCQxfm774PFkKhaYbMDqoQT8vbpTKLTvKvCfYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=Dd0bAtxS; arc=none smtp.client-ip=178.154.239.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="Dd0bAtxS"
Received: from mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net [IPv6:2a02:6b8:c07:179a:0:640:3367:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id 5B7A760E40;
	Tue, 26 Nov 2024 17:42:34 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id XgZIvsrOeW20-Mw75RNhj;
	Tue, 26 Nov 2024 17:42:33 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1732632153; bh=FYaL6aOUdRz3cVSgi1N298jEKsnDAct7nhDE9pvtzek=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=Dd0bAtxSPKa0aZXDrbrXOrnA4U8n53ocyry29OyOa/STPtTL3+gpRWuo3nkGLtPBU
	 nK4J1tcIiunKWpDTwFrswYmQh9JAA8DuuSKtGU+PR2P4ovRwN1tdehRGsCU819uE8C
	 /e2A3hNtVdb1S0OfJd/58EKt7lZkWiHCoi4FtZbw=
Authentication-Results: mail-nwsmtp-smtp-production-main-45.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Brent Lu <brent.lu@intel.com>
Cc: linux-sound@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] SOF: Intel: hda: fix memory leak in hda_machine_select()
Date: Tue, 26 Nov 2024 17:41:45 +0300
Message-ID: <20241126144145.4442-1-dmantipov@yandex.ru>
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
error-prone, tweak 'remove_file_ext()' to use 'devm_kmalloc()' (and so
use memory which is automatically freed on driver detach).

Fixes: 85b66359c5a7 ("ASoC: SOF: Intel: hda: refactoring topology name fixup for SDW mach")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 sound/soc/sof/intel/hda.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 01b135068b1f..a72f62f4e6cf 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1197,16 +1197,17 @@ static int check_tplg_quirk_mask(struct snd_soc_acpi_mach *mach)
 	return 0;
 }
 
-static char *remove_file_ext(const char *tplg_filename)
+static char *remove_file_ext(struct device *dev, const char *tplg_filename)
 {
 	char *filename, *tmp;
+	size_t len = strlen(tplg_filename);
 
-	filename = kstrdup(tplg_filename, GFP_KERNEL);
+	filename = devm_kmalloc(dev, len + 1, GFP_KERNEL);
 	if (!filename)
 		return NULL;
 
 	/* remove file extension if exist */
-	tmp = filename;
+	tmp = memcpy(filename, tplg_filename, len + 1);
 	return strsep(&tmp, ".");
 }
 
@@ -1285,7 +1286,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		 */
 		if (!sof_pdata->tplg_filename) {
 			/* remove file extension if it exists */
-			tplg_filename = remove_file_ext(mach->sof_tplg_filename);
+			tplg_filename = remove_file_ext(sdev->dev, mach->sof_tplg_filename);
 			if (!tplg_filename)
 				return NULL;
 
-- 
2.47.0

