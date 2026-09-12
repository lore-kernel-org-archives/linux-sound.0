Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86292EBDE9
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197667; cv=none; b=rGmFBaSYWW4KMVa9g+S48Bip0pav2yWVQGiGcHHO6dX2y8Ms84moEcUVfnA5GblLB/u6bLGgKsX04jDH8056pUxSgbQ6rD0qnUgHQCGS/ZcQU74fpF/zFpPHCSkG2oAydz+d3nkhPYmYLwjv/yKOJ8YZAUl7ISWCB5n6wzYxX0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197667; c=relaxed/simple;
	bh=AItdFu/Zb1+sw7gNCEZyyAyXtnpen3HADwATlxLwDLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A2sPLWcuTeBxmMvCczq4142Of8vYjCJdHp60dMhGCEm2Z5xQTrH70KWcB7A15LNbKia3eM0xpKpXzk+D7VR8NEIUqgRsTUNW2fYQSY9Mm75DxFnZQbClgkbUCbGD9FElpaCLh2+Zskk5iDiNW0/3RTcdiG78r58EeUqGY1cBEEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIkvv45i; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIkvv45i"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso266307f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197664; x=1789802464; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXBMF0EjeLgsp5H2MzIUlC57423Pq4q8bVTcofjrdQA=;
        b=fIkvv45iITOnajusb0/E2DZcbMPOSQ3Ht8v925WejJC7w+ddcpHEG0Ji70SJbpJDd+
         NtmUTTw7E0rQiGdg19Mu/JuLImUGND4yljSFkIJdD+lhFwTu2hRkg7z66Wqpcryzs6UF
         dhGPY/sA9RTPtN0y42U62BWqkLoJ9+00Ms3lXXiPtQjKxAQyTPshik8hQ70oDKb6RS6E
         /uSHXJJFAN40VvU/2RK8AyuY52nj9XrNIk2I3b6X0FQlvQdK1t7hbuWwAYWJH8qzHEIu
         ubYy9tBdcLpZmhLDTplsNnvZtMHJeLvlce75zsYLnniJsw61bFwz6Q59a6Q0OBrmMV6d
         h7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197664; x=1789802464;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXBMF0EjeLgsp5H2MzIUlC57423Pq4q8bVTcofjrdQA=;
        b=jAtUhIHSW0ejJnC2PrpLIjy+3vx5ppR/ivLFy/vK+ag7th94zhVQV2y2TVQ9szgHXR
         SmLhtBhrbsAiWaQtNCBf4y8jRFm1E4WJYtjCvIUQAaRK/fn/f6OhgE8W/T04ywVNtX2I
         De5k9p60qTrydzppOA6hVdHM9T6vgmw8BBJI708h/kvTlSco7fF2o4pVGC9+LLkal+/l
         F4aAxJCGA1EBTxJhx8Rn7OYcQ0gSUt3iH1i4+nnEkVwTseltsifTHsW01gp5pOKnUD2w
         99czBqSDQgdDPtdluYhpclKN6hrZBt9QuRAtwC35+owN8NGbYq2BrnO0g/alWI7OMUMP
         +/MQ==
X-Gm-Message-State: AFuF++m0Nu+jAK6zhjG18eUU702R0ZJeMXwEMU8UicFjO5cmWuU6cmNu
	vRrAnYm//khkEQLsKxw1oc9+5v13N0n//fgnBL8gLuT48PC6tAIlawwknK2GzZ+9W6m5ng==
X-Gm-Gg: AYBFou3b0dBG5i15+Pc5AJDl5Sgl6vWEPzSXuSxEKFkmACJztMmgqWTQ+7b3HLUQeUP
	KSekcfgLZ7uJI0sFJ1Z6TBA8UlIabEN7IfGVGJ+DNmbSws38o32KjdPR8/YR9SI8QFVQWCk6+0r
	vDlcmJEhKsod4WLhEU4ctWyWZCy4TqsJELyADr2q1YIQfXqMnckQEKxgLW+emvEObNBWgOVC+V9
	mpvoDDkLmXybQufqOQEOjM3waUccLZNd2Yv+n59Bz9wwkMImjKWkMQ2Tj5VcxPsog4VhjerWLto
	BEIGRC+r9HyQpPkPso2d3QFdqloboVGFKZlMWyVjlEOlbBL62aF849X2DsrrM8VnuJsk4iwZkVU
	br7HgzECjOqCAWl6UNYq7k94p5Yx0fZN9o2ypdhzmh6VLU2OluzvKnuY4KR7edZv0O1VifCeMti
	644TCsAWoTrD93UW+mAAyV9a9Bvhz3nio4WEK/nw9JNP5cHMuI1WctjGD2NHD25PLMIdfDKnory
	UXxoQ==
X-Received: by 2002:a5d:68c9:0:b0:484:3310:710d with SMTP id ffacd0b85a97d-486eb3529admr13577934f8f.25.1789197663780;
        Sat, 12 Sep 2026 00:21:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm11176305f8f.28.2026.09.12.00.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:21:03 -0700 (PDT)
Date: Sat, 12 Sep 2026 10:20:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: usb-audio: Scarlett Gen 2 mixer interface
Message-ID: <aqT9WwlIbsvOqeEx@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Geoffrey D. Bennett,

Commit 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer
interface") from Jul 29, 2019 (linux-next), leads to the following
Smatch static checker warning:

	sound/usb/mixer_scarlett2.c:4605 scarlett2_update_volumes()
	warn: always clamps to 127

sound/usb/mixer_scarlett2.c
    4589 static int scarlett2_update_volumes(struct usb_mixer_interface *mixer)
    4590 {
    4591         struct scarlett2_data *private = mixer->private_data;
    4592         s16 vol;
    4593         int err, i;
    4594 
    4595         private->vol_updated = 0;
    4596 
    4597         if (scarlett2_has_config_item(private,
    4598                                       SCARLETT2_CONFIG_MASTER_VOLUME)) {
    4599                 err = scarlett2_usb_get_config(
    4600                         mixer, SCARLETT2_CONFIG_MASTER_VOLUME,
    4601                         1, &vol);
    4602                 if (err < 0)
    4603                         return err;
    4604 
--> 4605                 private->master_vol = clamp(vol + SCARLETT2_VOLUME_BIAS,
    4606                                             0, SCARLETT2_VOLUME_BIAS);

This clamp() is equivalent to "private->master_vol = SCARLETT2_VOLUME_BIAS;"
It's unclear what it's supposed to do.

    4607 
    4608                 if (scarlett2_has_config_item(private,
    4609                                               SCARLETT2_CONFIG_SW_HW_SWITCH))

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
