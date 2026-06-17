Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560A23F8715
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699705; cv=none; b=oN6nkcXHH27U/bxpoSrO3RKCi0Z/rxhwVrhtSRe6D+TVIRFveiINhjIdxTmCJ37z85hTY7AAjEi83MuMDDc5q4+EWLDBEGVWGp9g4z7RGZ7wjbmL3q/J7dsgBneIiSEifDfauEYDmQZf+rdFXAaQsvDh7a6bNtNUWBmeIM/lFQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699705; c=relaxed/simple;
	bh=TxtAMfRw6c49QPn2ieMmApDAmybdDPBFexqvu7M43FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=iKvUH3hj3mJaXqUGR4qxznqaRVqsIYKDUZZ+ETVDl5U1FV6RPOVgAapwNl2TaIsC3zDdL7bTs1SSaaxiu4xQDND+360ubXqltwivrI/RaB6jFIM44/ZCqMfCn2Dp5/vTZkTrso0L1BG2VRH6ahSWxQX+m0vsszdVM2Tycaus67c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4hM+n98; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4hM+n98"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso2860793a91.2
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781699704; x=1782304504; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=th+O8xDVpoZexA9d63n8FPaXeCU/tEIdGTSJYT985eA=;
        b=F4hM+n98rYRYu5c6bgniwaNGxYY7Pt2YrNUPtj+TdJfHeC206g/9U7RR2O7VbjTG+H
         Laq02OlImRx9tAKTwIXYlDqP4vOBeEIsyOWgmlGMH1Hi/BygTtlAYMnus6nLQ5paHkFB
         SaJstylkJXRgke+Vck2+M2ht5NnzexGxjHR/qk5p3COBvupliYCERZxpSdmPQPfYLtTD
         oPKI5OH4Anhe+LkurOYlg1iB7LW3ywHrldGqd3EzBGSaaPCAEt1DI10MHbkzHt+umEN/
         ChIGednZyK1XBi705BcoH+okbbna8Q6YcRX9HpU4Xik81fylpW2TFqLHhhAazS/Jy1a5
         SXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699704; x=1782304504;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+O8xDVpoZexA9d63n8FPaXeCU/tEIdGTSJYT985eA=;
        b=Y3oUKwkxghNpFwqNkDIW47rhs/yh4V7o9tCPamg+38zFPvIiJtynynyumUzdnna81g
         O33wj7ZhS34dj+dtOMXFw3at23rD3oTNod0xqoJjK76VA4WxA+tC4EP+CRse5M8w1jrr
         XUnWPDcZwtl7CXApvF7njAV+bBXk+dynhUhL4f6ovKBT0lGN1XMuf2lHu5YlqAD9W8LP
         gc2vte0h6dhjN/qnGg/bjnM6MfiB+X9dFEGl1xZGySVyuryTV7RDz/ilmTQyDHVhcggx
         t6RIldC6NBYPQJjn0QXRHY1G8T9tzJi+FpzKod9nYljzdKtyrS6yccUPEEnXpnzq/J4Z
         niTQ==
X-Gm-Message-State: AOJu0YzipS80hUFYq8SIG1aynUeQc5NhMFYrxPE/yPxUHVEiTxZWY2OB
	YUakr7aXDhCXeojyksNoeuFBWyAl+ESYoDEsVzC7kkQOlVpwVkhG1W0b
X-Gm-Gg: AfdE7clBLtS5bY5VV1tpf0D9JOVjrYpb91b9Zh6fkZv4VmbhIpJdixrUqSDZgxRq/QF
	ICCly4qrDEnw+NlR6xPjtLwhrE/NzpJnXDPzVro8vMlgzs+errTzxiOaWmJP50KvrF3HQva8YaO
	gI9sjehqlPCva/tfcpIIeFdJfBO0jaapgmB68q6/Omy1X/83s+5JaolVq1A+p6HxBscTpa05eT5
	MoY9jomSgI/TSdhrLYNGoWeSb4i8OtqFByGX7YSD0eZFLtoRI3kLLxwvILoUXR53zyqvChBQXM0
	tED+dkKxYqfrIsfNsP77os1lQbN9cmoh4UQjQWEC3UigiKWCdwsInb8nsD0S9qGqDFjnU5gk00Q
	/CvLqTbiOy22nVjAyf6aJ2RPH+gVzmYzyeFbErH51Oo+Sh2fF043QitXl2nR25IRHd6Fr7pXL81
	XpdGpgtHfJg8ufaJEdBA5T57yLkLEVLbNa//0cXA==
X-Received: by 2002:a17:903:13c7:b0:2c6:abaf:85fb with SMTP id d9443c01a7336-2c6bc26b754mr35379215ad.32.1781699703518;
        Wed, 17 Jun 2026 05:35:03 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6be262b93sm21980295ad.68.2026.06.17.05.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:35:02 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Daniel Mack <zonque@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 ALSA: caiaq: possible out of bounds read in Traktor Kontrol S4 dispatch
Date: Wed, 17 Jun 2026 20:35:00 +0800
Message-ID: <178169970022.2950989.3295624331262791202@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi all,

I think the Traktor Kontrol S4 input path in sound/usb/caiaq/input.c can read
past the end of the URB buffer when the device sends a reply whose length is
not a multiple of 16. I would appreciate it if you could take a look.

The dispatch loop walks the reply in fixed 16 byte blocks.

	while (len) {
		unsigned int i, block_id = (buf[0] << 8) | buf[1];
		...
		len -= TKS4_MSGBLOCK_SIZE;
		buf += TKS4_MSGBLOCK_SIZE;
	}

Each pass reads up to buf[15] and then does len -= 16. But len is the raw
device length. It comes straight from urb->actual_length in
snd_usb_caiaq_ep4_reply_dispatch and there is no check that it is a multiple
of 16. The X1 and Maschine arms in that same handler do bound check the
length, but the S4 arm does not.

If len is not a multiple of 16, say 8, the final len -= 16 underflows because
len is unsigned. The loop condition while (len) then stays true and the walk
keeps consuming 16 byte blocks far past the end of the buffer. That is an out
of bounds read. The buffer is cdev->ep4_in_buf of size EP4_BUFSIZE.

The attacker model is a malicious or emulated USB device that claims the
Native Instruments Traktor Kontrol S4 id and returns a short reply on its bulk
in endpoint once the input device is opened.

I reproduced this under KASAN on 7.1-rc7. A length of one whole block runs the
loop once and reads nothing past the buffer. A length of 8 underflows and
KASAN reports a slab out of bounds read just past the allocation.

The fix I tried is to only consume a block when a whole block is present.

	-	while (len) {
	+	while (len >= TKS4_MSGBLOCK_SIZE) {

That stops the decrement from underflowing and drops any trailing partial
block.

Does this look like a real bug to you? If the direction is right I am happy to
send a proper patch with a Fixes tag pointing at 15c5ab607045 ("ALSA:
snd-usb-caiaq: Add support for Traktor Kontrol S4").

Thanks,
Maoyi
https://maoyixie.com/
