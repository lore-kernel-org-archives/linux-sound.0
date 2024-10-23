Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD2F2AD20
	for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729714530; cv=none; b=Rvo+3a3e54KlbiuNnJ4sBUQC10gGGWfr8fOQV2TKsoUZUXq5emC6Kk4PrEIu5BK7XOC2jYWCjrkAnGJvCtkwVzongDxaUMATj7iTzQnnz8+6sYB9HqflbAqdZg5AjlNMhhjE/4L+pncQ7f06Z/9ki5AzoxE5OcR9fBuJflLPbuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729714530; c=relaxed/simple;
	bh=wtqynZHXBinx/+OCmS7t52CLZXI4sm5wBRaonSS113Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=o+xkv8kNsTlW9OJD66D92Lp2tT6CfhHljAGBRACWNdWAVdt3MjmY23DVXmnPCEkQG1cqMRSZOtunq9Jj9ZwPo5PC/cbdN8cSQ/8Mbr0imiBRNg1DvYAZYmIVgLSSxC2/Mt9vz+sQo+dilyjXVjFAltINIQjVgkE72MWoYIfspVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H49PBOe8; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H49PBOe8"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so68003f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 23 Oct 2024 13:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729714527; x=1730319327; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8pyOwYjtU++ffH/7IZsdFM1L5CchGFn6E1SAePkqDnQ=;
        b=H49PBOe8VeqU0zRoerUNoHZAitwv68soLUAwS7Gc2PBTem06k4d/Ko9sxDWE3EWI1e
         pV6olKRZIr62r59+YH0vVFY7jTT17nv1OIambIY3DAPp2KAItclPUgHrpcNDwIZX2Vnv
         vmtpqqe+KdaInD+8FkuKXn/M5NU6sGoQT67GYe8ul3JKaPHhlZQq2JxbIIrHl3q3onHj
         oTyxdN5l3dvGFoZUVm6iUhc3xNMt0YkW+gsI61n/zz0v9FatKZdOjNdrQ3XCJeRZa3qX
         eUYGclEjJFfBxUWVEopJ6EcVvZjCuP2XPgJAfqh/zXyis/PTo5qwHa2K/6hTkL2d6Iec
         JElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729714527; x=1730319327;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8pyOwYjtU++ffH/7IZsdFM1L5CchGFn6E1SAePkqDnQ=;
        b=rpvZcUDzaGAA1JIlvWznlcqnCBBDTdZKxc0AFj5tAhFddxWtmYt9r+ucqg+2E0xBX0
         /djkfj+gUnMsCxZQHPtstumXy7Q8wSNyVY+2fx6FOAY/L8aKI6FlFS7dU24PxoB0qYvc
         qhFADe2ciAHHW6RYIDuz4qxjZ1tU3vEYIVcNvwooBXBnSKS9380vWecwgfCL3r7mO3sq
         9yNiTbzyqY0jGm+Oa4FEYcolGj7q5aJJp8181JW9kRvM8ldTy8vphbYeJYdo0F3K2tWj
         RrW8hz2e+gDdnyx/Z8FRBXtuiKakTP6Vv/kwWtAfzIR1Uzx+nkB/y+q1wPP9KMBrI0Qv
         gcCw==
X-Gm-Message-State: AOJu0Yyqp7g1h7t6x+Ty0uvpEniiAZojOwxC1BbwCTs7SlUpkutw1vtu
	1OFfJpiQ5+evwQ4O56uOkdBFagmiHX7qfRkFlnl7HtM5fPiHKEPRLLztJYy3V27cgb+8uP/o+Vh
	o4CrrC8z28nyQnQIKoz/Nk4FUyOi7xe7Kq0o=
X-Google-Smtp-Source: AGHT+IFrxKoxhRQ1x/wAgV+lXPi7s0woz7rHmU+IbBhQr9v5cGr90k/rF01DvxelvhS0T2fpZ9GxyK7CZLFjvnn7N9k=
X-Received: by 2002:adf:fb50:0:b0:37d:393a:97c5 with SMTP id
 ffacd0b85a97d-37efcf498c5mr2578227f8f.28.1729714526660; Wed, 23 Oct 2024
 13:15:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pol Xhaferi <pol.xhaferi1@gmail.com>
Date: Wed, 23 Oct 2024 22:14:50 +0200
Message-ID: <CAGhxWJ-4Kjw1zDvHaLDo=Qg=cuOfF_cYZg3kU03RaSrvTg_HQg@mail.gmail.com>
Subject: PCH/ANALOG CARD PROBLEM
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

HI,

I have no working audio on Ubuntu 20.04 persistent on multiple relases
.Sound doesn't work or works for a short time . First the problem was
solved by adding snd-hda-intel to etc/modprobe/alsa-base.conf. After
that stopped working my PCH card wasn't available/starting?. At first
the  card showed up on alsamixer and then disappeared/wasn't
recognized from it. After that audio could work by loading a Live Cd,
but it stopped working even on Live Cd .

I reported the problem first at alsaproject/alsa-lib on Github as
instructed by Pulseaudio troubleshoot instructions and I was advised
to report here .

My problem first started with Ubuntu 22.04, persisted on 24.04 and
only temporarily solved on 20.04.
