Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD9E2EEE91
	for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427834; cv=pass; b=daCLU05fP+oDfpxXQd0B1oaoUuEninjqObG3zMp3IhteC/sJp66pO8f7rPf26blErDRt9nONQiu6qd9LdBY3Dg7pE8e7AWtKeJoMXQjfBz639LL5ufMXicFqFIwS0TU9p968PoFIeBOidsjpNX8eO3NRpcpQAGk+QhWPV5CSBF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427834; c=relaxed/simple;
	bh=KPB4QfuQyfLFpvVLFN1RqwpJdFRHs9clkHigX3iiJE4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rqh+dqgIic0Xw2q3J55jeVuTubqwqoGUNhVVT9eMG3tw03dWRmwtiI93XhGp17mxPFRZpgulyjx41K5DKrB2v2KI1N5BQuWQSTsKmJnqXjL92Ig+yyunjbCTzw6oLLjOgB/PsVdRGnPB/5VxkWWNWROWHqDB4+gt/IL/oDBRBKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Bigq8mBr; arc=pass smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Bigq8mBr"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ab06778bdfso576259a12.1
        for <linux-sound@vger.kernel.org>; Sat, 26 Sep 2026 06:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790427831; cv=none;
        d=google.com; s=arc-20260327;
        b=YGhF1ysM1qyJlZ2XwzwgyfCdoWlSFcHmt4jsJBDXAAppB28yw+MaZkoCH0wnYBnRQB
         Pf0HdS3M2sviuch/KNSziHpGyhM7WKDY/nq7E2Nb2OdVe9egx00sC1/3tZxX/dWkW/Dk
         +/X+Bk6Hq0+NTdMDjp+Ix/154U41vdiLOITOA6HNsizivRYJZrcQdrNh/R9e6a8OLR1t
         lM9OEJo9DJsL223GfvTUYTxi3TvIBFwJcf70lQizr8dVkfA9/f1MxNPVnEBDSzGSwI0b
         FmxfXADx8ccR9oiHCJYsVMWXS6G43mCzHbHkTZff0L2SsH0/GoELj51BRFQE4oqa7cjb
         Pgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KPB4QfuQyfLFpvVLFN1RqwpJdFRHs9clkHigX3iiJE4=;
        fh=//pzVrQnuTgyyi5gKMZhQIG8tGO5yffAg3BSMJZGhOM=;
        b=qothQJ911Im9ZeG8GUGo3q/leI/eIDsVdLMi/IkB8qtnskXcTkg6gG7DwHaVPXxdlC
         XuglgwW8tN9MpijuPxKylOPP33v3r33j/NBYIuTIxHKiJohdljDuEIItz7xyJhfFtZJk
         lhgEX+ioaTlQ/9noLOcTZDMHaNgCjlQXtsYWvWta2eg5nK9x6nMtKUqH5bzQ/dxfLj8X
         UjTCVxN5uGtQhckbZxVaGxlbapuDHYF1NU8QXf8fOhKn86r0ksV30zcFaDrZIFQSCwtE
         LbgSa4FAKAJP/w5m0kjUab4/RzIVGlZL6V9yDEZicCJbnZq48T+bsr6mOotG9/eXTOQ3
         Ngkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1790427831; x=1791032631; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPB4QfuQyfLFpvVLFN1RqwpJdFRHs9clkHigX3iiJE4=;
        b=Bigq8mBryqX0Ds0N2EipDlro4L+H9O/z3QEvC2R2/KKo2UG8jq1WVXKVj4ImYJmJhC
         /pJNrV1Q2bOU3d+fujPLyzpAz79y5kjycTXtIJX9S5gM22ppi5gPn8dZAGquJK3sdFdk
         oAiAfWfz/vT7ws29OBupl5j8AK8wLNj3jMtANqJnrpMgkyzkudoi0noGIC1Wl275YgvS
         U8yqX2EkPVbMBhX+8nVOkQk3PVxxrVp3iFl3pSmqY0lLw52viRNUyRAmIS94gZzmKP+G
         qHLetdxslS6sQfKbhaoXqj6/fAkkJrz+8sjNt5VSvwvMOsvpW7UtExDW736Vnm/nRx5U
         LVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790427831; x=1791032631;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KPB4QfuQyfLFpvVLFN1RqwpJdFRHs9clkHigX3iiJE4=;
        b=Ok2D6bkxjMIzfCAwwosrkOTAUd6TFgVGb+wU3VxGHY9Fg1Ik+hSUqkcJn5Hyom67M/
         PgtGcx7njdDFhuDqwrWMlqtQTy2qpsUBk1pnFUEbY3ZcX2g/9KrqER0eFVovlK4A3Cg1
         oivQ9eQ9QNYJ+Pws1daGJ42PYpTsUcOo2/kRaK22e6/Qjb65ttX+2CBRmfJW5/8rHqJQ
         Z5UdebNdi7Kr1eXQ9+A6tWJJcptD3i/Xcn4ntmXrjT4hAXjLQzoi3ZyYFXg7f/4+3xRb
         39C3IY1eAYNFLZkq/TgXdm7cIoTTzwO8lN5xi1pBHMy/AkDE9u9cyJU0sX8oafBU8ibk
         96Ww==
X-Forwarded-Encrypted: i=1; AKwUvBwvkFrFtc63cS9ze6s9zOEeZvUVJGJ03u+mp9fKN+mfCr3rDxdH3DDlyAkm63uhHrNyYQ3EzJCSfm4B2A==@vger.kernel.org
X-Gm-Message-State: AFuF++lomPtz0jsWk1drLSqDQHNNiLQKxAq5WaM4xf74dyibxrISFgzu
	dZe1QO45utuEcf9Ae/j1+0prJsAiYRg6zEIr9zLCJ6wcaGLAg0WatmaAAQIPAjkLj1giwVqj6dk
	+usTkXYkUubs65Bg/VWstf7FxLdCxKpin0KkB4R3KHctWXpw=
X-Gm-Gg: AYBFou1KUvNO+ESWF+cTwq7CsJywM2OGkb/ylARKur9avGgKsc7mvw7zt5O/LQTHYA7
	iFqTBJAaq/Aupe7okHMW6Rk5ZV2go+mkzoGyDHpzC06t7FeBdsox1qhMsFfE0P+bkZSO8rbGKzF
	HbjDcdTyLFmgbq9FlTcnNbR1X0JuNBAZvP96RmtI5DvxITd0V6X+Da5Dk80oqWqeZSpP3tuOI3n
	jO/3Gyjwy0b8Qkk3UsApjsUpypTFgZoNGgLJRhCRrt7CRsci8sc06CxHThquOpH8FJf8kzmextS
	9HwSs9q8pRWOnCINHQRl67ZGCR9Ev4UK2dYR/njQ/dSL51jfnwfiyw==
X-Received: by 2002:a17:906:dc8a:b0:c25:2e93:289e with SMTP id
 a640c23a62f3a-c2ac233f3e8mr713822766b.16.1790427831544; Sat, 26 Sep 2026
 06:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Faaris Ansari <faarisansari@googlemail.com>
Date: Sat, 26 Sep 2026 14:03:40 +0100
X-Gm-Features: AclHuK952zT1VOkbWHfF6M_lj11z6Tzl9P8Q_FSCl8Jh__qj6jK24voSq9ltu-8
Message-ID: <CANBVYRCL=8QdLxGg4S6qrahrFtwJxhv-aSGpW7-1S=+iOe4ZGA@mail.gmail.com>
Subject: [REGRESSION] Audient EVO4 hardware volume control now requires quirk
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced: v7.1.13..v7.2.5

Hello,

A new regression has been introduced between an update on my system
from kernel 7.1.13 to 7.2.5. When attempting to control the volume of
my audio interface (Audient EVO4) through pipewire / wireplumber, it
attempts to modify the hardware volume, then falls back to modifying
the software volume instead. This causes the system volume to be
dramatically lower when modifying it through software. However, moving
the hardware knob very slightly to change the volume brings the
software volume back up to 1.0.

I confirmed this is a kernel regression by reverting only the kernel
on my system back to the working 7.1.13 (now EOL) version, where the
issue did not occur. I also tested both the 6.12 and 6.18 LTS
branches, and the issue also occurred there.
I also worked through troubleshooting this with a WirePlumber
developer to confirm it isn't an issue with the PipeWire stack:
https://gitlab.freedesktop.org/pipewire/wireplumber/-/work_items/1022

I was able to work around the issue by adding extra modprobe config to
my system, specifically the below:

options snd_usb_audio quirk_flags=2708:0006:ignore_ctl_error

Does this quirk need to be added to the snd_usb_audio module or is
there an underlying fix somewhere else?
While troubleshooting I also attempted to patch my kernel with this
patch set hoping it would help with the problem:
https://lore.kernel.org/lkml/20260919151840.24371-1-arc@gmx.li/
The patch set worked fine but this specific problem was still
occurring. Using both the patch set and the quirk above makes the EVO4
work perfectly however.

Would appreciate further guidance on helping to debug.

Thanks,
Faaris
