Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9D21D5B0
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 23:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774741333; cv=none; b=nqDt6gr/aVu3YDtDjZ0unfoW7Z4MMMm/fUT81c7EEZlHE7lvEWD5Tnk55VhM12VX8BqsaBjXhzxVU+/9PMfMe8i9HYjIqR4J0QFR/Iuzof8dnU9tnVqu8+37wMzanTH/PDqvwT5UCw90azex5Qa+PoaJLAQU7xFpyxVZoBXGryg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774741333; c=relaxed/simple;
	bh=6VikE9QahO0S4tfpWQ8WVaHXpdLsFB4nt+mq0zMMCr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XGyUJ7Yqn3Sq6HToYyZdpJQPDyGmsrGJLU1ZasnbA2376YBHfQfIOjacj3AGhLCn0fiDwE/lNM4LKVWhbjWr7TQZrbijp7Na13eXi4hgMZKg0Ueyxe5n/lgt8u1TkmDB6cF6j0RoV9DI93faiNJYLO0E1qwO5AdXo9Bgr2HMnZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvNzBY0d; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvNzBY0d"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12a74039dc6so2594455c88.0
        for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 16:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774741330; x=1775346130; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IuGEVdAmZt93QbCh5t7lpSoRd1IyGtjyr4GjfIzPOvk=;
        b=DvNzBY0dqcu0av/tZFu642kx1VwbkY0erjY7ybabGl5aNUvtDeAzr0aq1PJZg/n3iH
         xsGTpD3ll1/VNgHi2k4xc5e3lG8syWTwRyxuZEH4u2+qdxjEzaUmwcH1LXv67zC+jh4L
         qpQ5EAE0v5CWPt984POuJZ9yymcfeizidrEU9qoZ35LwuAS4G9eSNkqDJpKIfuh8Va6T
         UEKvaVxyP963YQGnoysNkWoF8RjiBHGxiqWZGUhKWjBi9YFN62YH7K/7g6K2lW3Fu1Gg
         ZLVhlPE4mu7XfJxZJGoNEHd67lc164709HtpzeiFCvFRTLFWoQtahz4sup1qgnjfnnIl
         sRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774741330; x=1775346130;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuGEVdAmZt93QbCh5t7lpSoRd1IyGtjyr4GjfIzPOvk=;
        b=AtJuhPzgYE0+3LQs2CFMbNNdYLmrGU01wHMPhIvXrp+kVLGdXw9F8WbF08xen566lv
         Mqi4ZERXgWQNRxOWo+SJkpDEBiyWYPbIVSZUiIBqcbjSevOMWlSI3QVedCUKlR07QJVg
         0Yvq6+ZgunzMklsxuOjG/qEyGbJTY8OOKfehQ46xCi7cd8o9gDQHo0qA7wB2dx5G0K7s
         y6rM2FYG3z4EHLlxnlXkztWJBAC2OHMS0hrzpBT0NYwsu/kjLj8T26GlhJZleQoJ3/yc
         SwS5ekByLP649o52FUKI3g36KbBPSi7Jv5fgb/uGA2YE4gB3Ii40RcnDx3VZy/nbhF6E
         biSQ==
X-Gm-Message-State: AOJu0YwTKnJAuc5o2Qx+/nUf7IHYHCJfrhYyKqx1EmTjScxROR0SU2f9
	jrF2f/2AiAK9Lk4nXmy0VUqk9xL09VPOFUaauTCSoIYZLfQF/OGXUQp6
X-Gm-Gg: ATEYQzyu41RrYIVhe8cyfQq3UyGnfAIFG12vbLwM+OP0mL1EGWKkj+9jqezaNn7ew/n
	KYuX2xuHmhR+edniPwl/30E/Ehfb+tszrcnjGxm/IUzaPkRIJ2T9YAOWGJ7P6EJKSCfQWXmvpyR
	ghT+wJk5XTs0ndl6BgrbxIOaf7/ZLNEd86jPBIjDdK+dtwq9V5cy5dp0YNLFLwVyYhrCSSzhWFb
	fszigeNZnOMTjESQWPShwCuItCW4tCNVahqAfQk3OrIwHqAUkdYSImcMT+TNEjndZyY3bpIhBZg
	YxK9t2Fite7ejofG0s0Ppr/uHbAShjPywGi8VsF6sQ2zFUDPiWAEESbLv3k6qm4fkL7E1c2VgzE
	uuksFEI6TGVuTBKG0zHXwX5Hv2dkL/8RHVGCQVjPS2iF2fMHElqhlWx/fhKpNWQrl1a1lPbrWr+
	ZR8WHDH01IbjHXJtLeGoRqSNiWnjVDGRWBZ3TlqvDu3FNq5H6GuV2ZMQdTNK8LYajYP9MW6PG9n
	w==
X-Received: by 2002:a05:7022:458d:b0:12a:78c8:df with SMTP id a92af1059eb24-12ab28d13efmr4638397c88.22.1774741330387;
        Sat, 28 Mar 2026 16:42:10 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm4514050c88.10.2026.03.28.16.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 16:42:10 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sat, 28 Mar 2026 20:42:01 -0300
Subject: [PATCH] ALSA: hda: intel: Drop obsolete probe-work unlock
 workaround
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260328-hda-intel-drop-obsolete-probe-workaround-v1-1-bc43aeafc98b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQrCMAyA4VcZORuYlenwVcRD22QuOpqSdiqMv
 btTj9/l/xcobMIFzs0Cxk8pomnDftdAHH26MQptBte6Y3twPY7kUVLlCck0o4aiE1fGbBoYX2o
 PbzonQjqR813n+ugH2HLZeJD3b3W5/l3mcOdYv31Y1w8uIs6VjAAAAA==
X-Change-ID: 20260328-hda-intel-drop-obsolete-probe-workaround-d7d2a5528caf
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2399;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=6VikE9QahO0S4tfpWQ8WVaHXpdLsFB4nt+mq0zMMCr4=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJkn0gP+H7jyfHmRboVc+bQF2sweW5fHb94SUnfwzuelh
 83SPfRVOkpZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAi56MY/ilHTfkwfe/OD5e0
 HNYGL3tUM2XDedcrtYsSdt7SrDbau3ghI8PcKcpPDmhvYxcs+x9jPD+MVa/CYvEn2yzBAAPjG7d
 j/vADAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Commit ab949d519601 ("ALSA: hda - Fix deadlock of controller device
lock at unbinding") added a temporary device_unlock()/device_lock()
pair around probe-work cancellation to avoid a deadlock between
controller unbind and codec probe.

That deadlock depended on the driver core taking both a device lock and
its parent lock during bind and unbind. Since commit 8c97a46af04b
("driver core: hold dev's parent lock when needed") and follow-up
fixes, the parent lock is only taken when bus->need_parent_lock is set.
The HDA bus does not set that flag, so codec binding no longer locks
the controller device as the codec's parent.

Keep cancel_delayed_work_sync(), since the async probe/remove race
still needs to be serialized, but drop the stale unlock/relock
workaround and its outdated FIXME comment. Keeping it around only
opens an unnecessary unlocked window inside azx_remove().

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/hda/controllers/intel.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 8a7bd49e411f..1b22dbf7a719 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2433,20 +2433,7 @@ static void azx_remove(struct pci_dev *pci)
 		/* cancel the pending probing work */
 		chip = card->private_data;
 		hda = container_of(chip, struct hda_intel, chip);
-		/* FIXME: below is an ugly workaround.
-		 * Both device_release_driver() and driver_probe_device()
-		 * take *both* the device's and its parent's lock before
-		 * calling the remove() and probe() callbacks.  The codec
-		 * probe takes the locks of both the codec itself and its
-		 * parent, i.e. the PCI controller dev.  Meanwhile, when
-		 * the PCI controller is unbound, it takes its lock, too
-		 * ==> ouch, a deadlock!
-		 * As a workaround, we unlock temporarily here the controller
-		 * device during cancel_work_sync() call.
-		 */
-		device_unlock(&pci->dev);
 		cancel_delayed_work_sync(&hda->probe_work);
-		device_lock(&pci->dev);
 
 		clear_bit(chip->dev_index, probed_devs);
 		pci_set_drvdata(pci, NULL);

---
base-commit: 39b68f430a1b299a041ce44a695ae9ddb2576ca1
change-id: 20260328-hda-intel-drop-obsolete-probe-workaround-d7d2a5528caf

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

