Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5BF37D124
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 19:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206350; cv=none; b=mZT+Er8kiFqf1VsN1kaSUr2/vF1/ak+lbdY8/e9IFHFdL42c2uvPJhY6BRUaG/utJjsFz3ywrE67WpxkAOsETinOPhSqOMfCAeztLlFvrMs85Kzbr8ELfQQ3x/4CX/sluxjz1mGf6yHrl0THrmY3+eZlIyn+r8gcpRHcOdnMw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206350; c=relaxed/simple;
	bh=LpdfBgI5hlVDVn8j2JZDFsHWu9ooeZTtZi23kvECrcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O4MdlrI34hVPMBrcogx5xBZU7bTW+Rixb2aS9bGSoc1eedJy2k7v+28cPJH/KBKKfm9Ztb9G5IGv//g4HE8XOYcEQ1RzK+6roth0uX4I24dmW9w6sYKP87067XOm5DXpu3Ew/3a+pKJrOIVsT+6nqQNCoj4Qh1cT9nvggE0dwMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGqsRZDC; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGqsRZDC"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4843e9c5960so147435f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 12:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788206347; x=1788811147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7mhcNAnRbIwdTU9PHJdbUmDGbeZaGhWkvRXnYHgK10c=;
        b=HGqsRZDC5U/k6zZt9R28P6ybXhrvEjNfjnwQME5CvBfqxmzd6wzOZTOM96MHeqg50s
         uVWJoD54vYAStSX02MTWOsaV7WY2bbMLBOJyp8lFGUgQntQpJrP+PhuQiM9VAp0Tz5hy
         0LR4NhStmovcFpdzpCzhY7Yg/nzOawW5bBaVnyaVjHQFa2wbdrk9u1yB3A2uKEPflgfy
         5jntZ2uwYZJNsOjIUnwil7xq4gtu1ugCSxiugKOtujyDxOLH0iT9TXhaHz+Azc3ldfBI
         yNEmjQlg9TzJO3HcHL8Euxr59+wc2X38bpU0WqLI83WxmoM/kcxuNDdgdV+vDaUcbMCw
         EYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206347; x=1788811147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7mhcNAnRbIwdTU9PHJdbUmDGbeZaGhWkvRXnYHgK10c=;
        b=bPlUQBajHD1U6IXCjx9SA6L4SSjasdFzKm1NBZ4+D3A04V5v2AZx2YbZan2KzaScI7
         NO1ik+M32frVlbH3/gujW8gfy5kI5WHGgPLcs4RWNiR2Ab+as1/3zQkqSiiYFQHBOSLl
         0dG8dMsncy1BVdVZ6FtMpwJZYiYn2MvpM7RhhQDSSFluaLQVfgrfYu6SjY1Q8AZ7NbGz
         ejkrIh0w8etxx2ilEIbH0rAxLxaPIyHHoDJ8q5tgeqzI3A3LOZJN7Dz6wU7/lWapaSRb
         I7S2BQw8JW/eVXd0eS/hbCQkZAAN7gutW6g/bD/VwgmI5Q58//YxH12Eon9xauJMpSiF
         zVGw==
X-Gm-Message-State: AFuF++kSbcUZRNeZDvEUsQ1hf8uklwU5XGyC9rGBAObZmqgKjjsfmGRi
	NwG3Has2EHXPCeflxhZTQIUuC4e6BCTSZKUXPE8pQ8ql9I8vdpjjE5s9fLpFPwlgO20/jzLa
X-Gm-Gg: AYBFou2hyWIIn7nDIQjnCsDPu/fEx4KooNVuiNwpaFjVlrHn3r7IOrb+I89jx+P0Tni
	dIzKERxsenNNOVVCtd/YcBXkscly6CgCilDioPoaZ2fn4z2DJWsZcCIgkzsveMCo14WfqLJzaut
	cVCTLGP9mR3BYdvzQ+cazmdRfq2o6X6xUG1wcILX0ASyNlZypVqG8pKRr77pnWCLusCc8bwathY
	HAw0KtXMXOsqBfCSw7Yyzgbhn3b2mOPDiuqRx+3EoaxNM7waLDo0dwJRSu3lzjVnXZup7usLyQI
	8h02LIsodtDuULcDdIXpaXhWwlc51bDYVKjxj853ydJA9653ziyXyomemFor+MjcBOfzCjoYYrF
	4+WQe1WGjEn1GLAy7IGT0EaLNNuTaObR1SfEapkEn31Vfjw8XiX0t6ehuzvdeYOqvKPbPOZFyOw
	8rvLlxbEPyYyY36+3gHU2or7jlYyUqlEh/zD854YL1tKFFpUP/TbJ671SPVgL0mzazTR581HX8z
	gFXV5rJG4chjLzcHSO1y9zSCJE5epKBxbvmunu4oZXrmeTUEGsTn4Be1OpNhpmjUPe5A3DMKs89
	zqKm1+mOxt7SuBm8IaCi1C0eykNIFE+asN7PWlGSGKcm/4b7F9D2w98dc2xikU4LQLx9OVGGeg/
	CCWGMtLNhSa02zTOKoqOBrOLk4jV9q67KtVIPuqo=
X-Received: by 2002:a5d:5f50:0:b0:482:e263:2c7e with SMTP id ffacd0b85a97d-482f79b351cmr49636389f8f.13.1788206347284;
        Mon, 31 Aug 2026 12:59:07 -0700 (PDT)
Received: from lethean.posam.sk (edunet-static-43.87-197-88.telecom.sk. [87.197.88.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c460sm85409f8f.13.2026.08.31.12.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 12:59:06 -0700 (PDT)
From: Peter Drabik <drabik.p@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	Peter Drabik <drabik.p@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add mixer map quirk for Audient iD24
Date: Mon, 31 Aug 2026 21:58:55 +0200
Message-ID: <20260831195855.1836617-1-drabik.p@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Audient iD24 (2708:000d) exposes feature unit 12 as a 4-channel
"Speaker Playback Volume" control (cmask 0xf, -127..0 dB).  The device
does not actually apply this volume to all of its output channels: the
left main output ignores it and stays at 0 dB, while the right main
output honors it.

When userspace (PulseAudio / PipeWire in a stereo profile) adopts this
control as the master playback volume, any setting below maximum
produces a stereo imbalance on the main outputs.

This was verified against the device's internal meters: with the
control set to 107/127 (-20 dB) on all four channels and a digitally
identical L/R sine played back, both DAW return meters read the same
level while the right main output metered exactly 20 dB below the
left.  Restoring the control to 127 (0 dB) restored the balance.

Rename the control to "Monitor Mix Playback" so that it is not picked
up as the stream's master volume control, in line with similar quirks
for other devices.  The control remains accessible for manual use.

Signed-off-by: Peter Drabik <drabik.p@gmail.com>
---
 sound/usb/mixer_maps.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -496,6 +496,19 @@
 };

 /*
+ * Audient iD24: feature unit 12 ("Speaker Playback Volume") sits in the
+ * monitor-mixer branch and does not apply volume to all of its channels;
+ * when userspace adopts it as the master playback volume, the left main
+ * output stays at 0 dB while the right one is attenuated, producing a
+ * stereo imbalance.  Rename it so that it is not picked up as the
+ * stream's master volume control.
+ */
+static const struct usbmix_name_map audient_id24_map[] = {
+	{ 12, "Monitor Mix Playback" },	/* FU, partial channel coverage */
+	{}
+};
+
+/*
  * Control map entries
  */

@@ -579,6 +592,11 @@
 		.map = maya44_map,
 	},
 	{
+		/* Audient iD24 */
+		.id = USB_ID(0x2708, 0x000d),
+		.map = audient_id24_map,
+	},
+	{
 		/* KEF X300A */
 		.id = USB_ID(0x27ac, 0x1000),
 		.map = scms_usb3318_map,
