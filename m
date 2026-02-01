Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB40128C860
	for <linux-sound@vger.kernel.org>; Sun,  1 Feb 2026 23:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769987550; cv=none; b=aev0ISgICGYPv4Dti/DUzoCX6jLU2hty6F7zWHE7rTfb7ObsLvqxgYVlGkKf1Sd0xs3FqrLbyoS19I4/ZzDKFwFu4yapgNjgd55rwePU11KVM4KNOt097AAyu56bzY8Foy0IJeVVWae8teYFHPb8y7eddGBpQ1kVPmCob2sY11g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769987550; c=relaxed/simple;
	bh=7xpTsA3boAs8pXi3q2sU1wl21PupGuYFJEg+qaUYIcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7GO8eeg/SaqsqVk/Ta6k/h1mjJM/XPgy+ZYqaKw/OsneUnxiUWTchRHdWQU5jeLW6+Pjk5FLEfsWtztUOK6wOFYGJ4QnxdTAtkKC5smtpG/ifEsEf84Jx0vqR55nPKBdH8BRWSshFRzeIKsKzVuVtmvAZDhYfHnyyDvQJxdwcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dionne-riel.com; spf=pass smtp.mailfrom=dionne-riel.com; dkim=pass (2048-bit key) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b=koN7zz+E; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dionne-riel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dionne-riel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b="koN7zz+E"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c52f15c5b3so393127685a.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Feb 2026 15:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1769987548; x=1770592348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eVd9EbrAgoRDpRJxMhlAZWwOtOfaI6xh7igmAxLlPU=;
        b=koN7zz+EhieYoUcO7izer3ilVMoGQwSSrLcJrWjWeBXYwUt7uTa7yEY5T+cBEVVkqu
         nAdsPCOrpekHuUnN96rvH9NGf3x6Af397sVr8PiaQMhEcMUMZaQ8u/mMm7b4s/oXECAt
         KdyT4y3bPcC+IPbi6YdM4eq/SwLSeQFe6CukTx+oF4JNS6BrKpmRFcEyhrZl0+cqpHkw
         stjCw0y85nKnSsP/bYhF/sHrz+5CxttQ5OYFzGOW6JfdtX9i/SPFnOWV/4zfI5SXRny9
         H187Mc2TLw8xeNteVZnMC8Bc7FBBXKwXqOd5va0nvebX0yTXBa08mPjAm2+syweW06He
         voDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769987548; x=1770592348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1eVd9EbrAgoRDpRJxMhlAZWwOtOfaI6xh7igmAxLlPU=;
        b=IYeSUSiCVrtYwKzr4ZXn/Lfr3VZWqQuQS2zdDSdZJqRLvqPOJOdBJRZG0NKm01VQDd
         pHdt3hpPqTtwn5Dxs+7W9uZN/Gs/zptarrNxZXY/2RZ1hhl0fotwNx6llgCGqv5uKKJS
         uhwRtx2CzRzNX+nr45cuADeblrMcX0O2yP2dHFH1kuT6s8Asbzq0bSxhopLOzmfQVZY/
         OO6RZMZe2lFsqzxygz9CJZdIUEPvKEsMRHxRHjEIxPOVvwf0ePQAb5BzlTkfGnBz0Cs/
         vGTh+lrOOeDNNcFiWcObDOG41JMpbMWQwvCLVGilmsQQkw9TNkdGFKBkVBjFRAJLYYQP
         lmtg==
X-Forwarded-Encrypted: i=1; AJvYcCXWGQmTOZj2uSoN1DXJidCd+GgLXqsrKWCUrJ5fYHQaZw7j9KamKGSe1aCAuYmSE5O2Gu2pzP52QBjpNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1QVcS5FPBwbXywxuiLKmMlAXCZLt6MdtHeknd8rJ2ymEeS8w9
	TzCY/93YvbVmuN4MnmjbuLcP7dHuVhEIbUhI6jxKmMu5Q/lMpiTbCVo9LtrpCwrACg==
X-Gm-Gg: AZuq6aK4y7QtfpezLdAy/Gpk6FFeuEYR+qJT9Ox0oYbhpKvRTZYarCopgqAL19D7Za8
	m7RRfq4Pj9zpLJdyIkYWyDOBzDxrwBio/CPeGH4RnwfjJ1YfdvoCeqqIzE68MhaBg4bUPryGFSN
	0A9ty6mIKbkL3v9CZko51lM6HcS5gjoEodTj/D4QiqclA+42WGxAhytcV10CbExSQ39YN9MpfoT
	lOYSV3asHgDUuVQCHz0NOK7w1u3VMdL3qBa1+YaR7ZvxlzNIvXZ6yo+Wb3ddqEWhrRQeFeitHhU
	CftWxmLb+G0ItxdMY0pNBj6fHkwGV0OPyD2t/JbM7iBPwbbTDrbKG9RB1KNVRZyd4nifEijUO4d
	+Ump4Ewdk1/iP+4Et/OckH7FzgC68MYQgsP7OxQBTYjqQoO6pMLASQCWH/G3D8vaHz1L0p3yPN3
	GTAjLgCPsRrgX+8Lr3NFS0+yO32SCFSbWzt1L/b3bXL3IxKiGpA/zjDeLNcxyB7PZjZw==
X-Received: by 2002:a05:620a:254e:b0:8c2:faed:ded3 with SMTP id af79cd13be357-8c9eb349005mr1282201385a.89.1769987547873;
        Sun, 01 Feb 2026 15:12:27 -0800 (PST)
Received: from frankgrimes.elk-nominal.ts.net (135-23-195-66.cpe.pppoe.ca. [135.23.195.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d3740d73sm102537246d6.27.2026.02.01.15.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 15:12:27 -0800 (PST)
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda/realtek: Add quirk for Minisforum V3 SE
Date: Sun,  1 Feb 2026 18:12:15 -0500
Message-ID: <20260201231216.1655154-3-samuel@dionne-riel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260201231216.1655154-1-samuel@dionne-riel.com>
References: <20260201231216.1655154-1-samuel@dionne-riel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This likely will apply for the Minisforum V3, though there isn't a lot
of information to confirm whether or not the identifiers are the same.

The Minisforum V3 is likely to benefit from the same fix, as it exhibits
similar symptoms. Though users reportedly work around it by forcing the
software mixer.

This was verified on the Minisforum V3 SE, and the root cause (the bass
speakers routing) was found out by using pink noise, and playing with
the mixers.

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>

---

For posterity, and hoping it helps someone else in the future, here's
the breadcrumbs I followed to get to this fix.

(Stopping other software, like Wireplumber, is needed here.)

The following command was used for the pink noise:

    speaker-test -Dhw:1,0 -c2

By using `alsamixer -c1`, muting either of the "Speaker" or "Bass
Speaker" channels showed that the speakers were indeed separate. On the
side of the device, there are two speaker grills next to each other, and
by moving an obstacle in front clearly shows the channels are
independent.

This differs from the “well-known” wisdom, where it is assumed the
speaker can't be controlled with the mixer. To be fair, software like
Wireplumber will mute the Bass Speaker in sync with the main Speaker,
which makes it seem like there is no control at all.

Knowing this fact, finding plausible fixes in the sound stack pointed at
the kernel driver being responsible for tying controls to the outputs.
And after fighting with some of the tooling, finding out that the
necessary knowledge is found in /proc/asound/card1/codec#0 in a quite
usable format unblocked me.

As a final hint, selecting an output using `hda-verb` uses the following
form:

   hda-verb /dev/snd/hwC1D0 $NODE SET_CONNECT_SEL $INDEX

Where `$NODE` is the node identifier found under
`/proc/asound/card1/codec#0`, and `$INDEX` is the index of the desired
DAC connection under `Connection:` in the same `/proc` file.

For my particular system, the `$NODE` is `0x17`, and the DAC can be
either `0` or `1`, as `0x06` is the DAC without volume control, and
`0x08` is an input.

    ~ $ cat /proc/asound/card1/codec#0 | grep -A15 '^Node 0x17'
    Node 0x17 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
      Control: name="Bass Speaker Playback Switch", index=0, device=0
        ControlAmp: chs=3, dir=Out, idx=0, ofs=0
      Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
      Amp-Out vals:  [0x80 0x80]
      Pincap 0x0000001c: OUT HP Detect
      Pin Default 0x90170120: [Fixed] Speaker at Int N/A
        Conn = Analog, Color = Unknown
        DefAssociation = 0x2, Sequence = 0x0
        Misc = NO_PRESENCE
      Pin-ctls: 0x40: OUT
      Unsolicited: tag=00, enabled=0
      Power states:  D0 D1 D2 D3 EPSS
      Power: setting=D0, actual=D0
      Connection: 4
         0x02 0x03 0x06* 0x08

    ~ $ cat /proc/asound/card1/codec#0 | grep '^Node 0x0[2368]'
    Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
    Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
    Node 0x06 [Audio Output] wcaps 0x411: Stereo
    Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5d38e371a6836..bcac3e9f106ca 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7370,6 +7370,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0xf111, 0x0009, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x000b, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x000c, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)", ALC245_FIXUP_BASS_HP_DAC),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.51.0

