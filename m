Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D78925B0AF
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 22:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789772277; cv=none; b=FG1RSwYA/gxjjTKEWBX6bodiIbAI9/IwG4rSXLxLprgiz/gFKT8aL2E8xdxCbzk1AQJ7V3kTeqwQdJAHZFmlwgxTzraCqJ/lp/EQS3Nsb41LgLqmMIHEptGl/aVS6ty4blZubLOwfnNOoZ2Xd90xt8UQzBHa1hUbkzWk13KXT7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789772277; c=relaxed/simple;
	bh=SDegTO856SlGdHFm7r4VDNIsIR16qwMlpHmXx0pYHDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AzfF6UB6qPmO+mtp5rlVEA7bfSnxtbYz9cV9qOVvbTXIeDOZf+xd1qeCQlgVxeDmwuWZBjnp81zZVKn5jU/dd3IjIrtJT8V5lSTAG1Tk0NnL2FVX56LPPfqQAGI/Uuyo88YyobAPsUtIiHt/pJ62F6hG6b80MwrsEGsNSM9McwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=cV9erDuc; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="cV9erDuc"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d91ede8035so15628475ad.3
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 15:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789772276; x=1790377076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7XKncLmtrLW+hywq1xIiUEnkxPl1olvH1vFA4vdnOU=;
        b=cV9erDuc4zxcqh1hF08++t0iRUFfgZt68p5oVdnAAKlWfQvA27E1kpGkHyXk3fcbS4
         aDWxNo24MnYc+7LMf0OhGy+graf7hYhKyBYT7MPsE9QE/1mtAUTI38IwEF/Wy350GSnZ
         4jll6xrST79/bM5+zlo4prYRDo63tE7ZFn72Fn4f0fEdf02dizgY7aiFHmZGJrcA8Cj6
         DFWr82+W+xYSRevw4Z0UpcTfLn8zfYz8JaYGO4mzJklWGZPr2noa4xFg9SPl0BgurSqZ
         TS9Jq320D0IQ5sx7h0dR3KWvwU51pir+Xjn2ktI5X6EeC5xduYL+mQIv7CSjHvctanCG
         pTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789772276; x=1790377076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7XKncLmtrLW+hywq1xIiUEnkxPl1olvH1vFA4vdnOU=;
        b=o+VPoUwpyOY9vEM8V6XrqTCCcfNKGr3R3oceezURwZlxx7+90shTh+qDI7YIbGtg6P
         gmZCuqfYfwKcdfdjJPpmd9lqnS+LURN+AdFbeJ78I5p0oCzzqoLUQPrnyPGv/wVRr2r+
         gTYTSgEPzr4epoBEtMyL49Gt4w3UFsDmXDTd3X2H2ylk9f16X79Gg2QDT+izXddZDmf4
         MpbTN67Uc4fi7Py1ue4gDcBw+xJAgfjolS6quf3DOpF2uUNK23ZqmxiM3K1CTwal5GSW
         i0qSTeKkl9Qbe2c7cOugc31ljTuS5uyEkliGIJrkRCadXq8pDyVVu7+zYWPQC1U450k8
         gfEA==
X-Forwarded-Encrypted: i=1; AKwUvBwgQ4e8BxL0cbxR8gqJJGQWtHiyXI9Y3Uth7VjoOW/BQr/ltS/0+rGZjmEqsk0Mq1bCRzQymALqIbMbIg==@vger.kernel.org
X-Gm-Message-State: AFuF++lmjg4gIv2Z7dHKu9flswtkeuFlm/lIDbvpA8SOg7EgBUnwtGA/
	+9sHz0Xd/uC/RugyrsJhvDE6sfUFV7CAEfmiOHi9Ap2fX1nxgXaoFHsMub7QEXNiCj8aox9tbMH
	SOf68jw==
X-Gm-Gg: AYBFou0wyA7WTFBsTHjki9UWjdMDHuRk5nCp0VIHu1Sl00pSs6icnomMZ++lcAfXrnP
	BLX8v1M0rCfSeGHmPp4QvKe1+sIy/05B6UczzckkQHRkq5Fs/XM+wPcpiFhMdPOmEou46i61Hmt
	IOW3w055U9T0/rBtlWY7llLHZ5+qPMEJTzf8ZkhWWJsF1w+AStsSh+EWZp+y3y4OzGQrg+9eHWO
	lD0J/9Zlb8erAV1WbLvkO6+wvuNVqX8tnzWEeM0fF7kBDsjUb5MgSfPqZfMvz8nveQ+INMyApOV
	dkAzvWwZ+hdyOe4+erXWJDQBAU3WaciLqoGclhbyd3boxyyvv/MLzRK5ipBUdUdw4HHsXc/gliS
	dVuViswNt7alzDBsX1OFmpojDNVOPVgYttQvib16W3ivcfGTx0xZUjiEl8hcCsYN3BNJNxxPoDm
	w3Pj92Io5WssCTebKIHNSqzA9tIkh7ABKcdI3sun5wP9qorglFT9KUv+sTxTIrx+M4WBbn0dYk2
	u5OCxLvUQIchnCEmymZWNpHZomkGkI4Mf7w7Q==
X-Received: by 2002:a17:903:2349:b0:2dd:c100:9432 with SMTP id d9443c01a7336-2ddc1009bbdmr13766535ad.48.1789772275799;
        Fri, 18 Sep 2026 15:57:55 -0700 (PDT)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm1899941eec.30.2026.09.18.15.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:57:55 -0700 (PDT)
From: Xiang Mei <xmei5@asu.edu>
To: clemens@ladisch.de,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: co+24304d323d28f156@bugs.sh,
	stable@vger.kernel.org,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH] ALSA: ua101: reject mismatched capture/playback packet sizes
Date: Fri, 18 Sep 2026 15:57:53 -0700
Message-ID: <20260918225753.1278505-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

detect_usb_format() cross-checks bSubframeSize, bBitResolution and
tSamFreq between the capture and playback interfaces, but never relates
the two endpoints' wMaxPacketSize and bNrChannels.  Each playback URB
gets a buffer of ua->playback.max_packet_bytes, while the number of
bytes written into it is derived from the capture stream:
capture_urb_complete() computes frames from the received capture packet
and capture.frame_bytes, and start_usb_playback() and playback_work()
multiply that by playback.frame_bytes.

A device declaring a large capture wMaxPacketSize with few capture
channels and a small playback wMaxPacketSize with many playback channels
therefore memset()s and memcpy()s past the end of the playback buffer,
in open() of the PCM node the driver registers during probe.
usb_submit_urb() rejects the over-long iso_frame_desc[0].length with
-EMSGSIZE, but only after the write.

Reject such descriptors at probe time.  Genuine UA-101/UA-1000 hardware
declares proportional packet sizes and is unaffected.

  BUG: KASAN: slab-out-of-bounds in start_usb_playback (sound/usb/misc/ua101.c:586)
  Write of size 2048 at addr ffff8881098f3c00 by task exploit/5021
  Call Trace:
   __asan_memset (mm/kasan/shadow.c:84)
   start_usb_playback (sound/usb/misc/ua101.c:586)
   playback_pcm_open (sound/usb/misc/ua101.c:679)
   snd_pcm_open_substream (sound/core/pcm_native.c:2829)
   snd_pcm_open (sound/core/pcm_native.c:2865 sound/core/pcm_native.c:2932)
   snd_pcm_playback_open (sound/core/pcm_native.c:2891)
   snd_open (sound/core/sound.c:166)
   chrdev_open (fs/char_dev.c:411)
   do_dentry_open (fs/open.c:996)
   vfs_open (fs/open.c:1101)
   path_openat (fs/namei.c:4837 fs/namei.c:5000)
   do_file_open (fs/namei.c:5029)
   do_sys_openat2 (fs/open.c:1417)
   __x64_sys_openat (fs/open.c:1423 fs/open.c:1439 fs/open.c:1434)
   do_syscall_64 (arch/x86/entry/syscall_64.c:61 arch/x86/entry/syscall_64.c:84)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

  The buggy address belongs to the object at ffff8881098f3c00
   which belongs to the cache kmalloc-192 of size 192
  The buggy address is located 0 bytes inside of
   allocated 168-byte region [ffff8881098f3c00, ffff8881098f3ca8)

Cc: stable@vger.kernel.org
Fixes: 63978ab3e3e9 ("sound: add Edirol UA-101 support")
Reported-by: <co+24304d323d28f156@bugs.sh>
Assisted-by: LLM
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 sound/usb/misc/ua101.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/usb/misc/ua101.c b/sound/usb/misc/ua101.c
index b9a62e94e06c..2f0f4233380c 100644
--- a/sound/usb/misc/ua101.c
+++ b/sound/usb/misc/ua101.c
@@ -1002,6 +1002,15 @@ static int detect_usb_format(struct ua101 *ua)
 	}
 	ua->playback.usb_pipe = usb_sndisocpipe(ua->dev, usb_endpoint_num(epd));
 	ua->playback.max_packet_bytes = usb_endpoint_maxp(epd);
+
+	if (ua->capture.max_packet_bytes / ua->capture.frame_bytes *
+	    ua->playback.frame_bytes > ua->playback.max_packet_bytes) {
+		dev_err(&ua->dev->dev,
+			"playback packet size %u too small for %u capture frames\n",
+			ua->playback.max_packet_bytes,
+			ua->capture.max_packet_bytes / ua->capture.frame_bytes);
+		return -ENXIO;
+	}
 	return 0;
 }
 
-- 
2.43.0

