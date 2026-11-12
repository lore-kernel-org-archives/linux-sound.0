Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458801;
	b=QxkPzQclRpwL352MyOFdUV1TPGGTGX1J5FdJTtB5Tp8FZtI6xlvdM6VbvPaXsofcPH3p
	 jZn8NNXMDvJG3uUiAW758JO15UNNTz8/dLmcMCKnAEeRhYJp4dmCE3B1NXD6Be/ymZUNa
	 mzDt5tqSEp1P+BZs4AwrxszjKqq69vwlBKwKjWyzvhsnRZmbzi248Op/kDBbPwOcRRIKp
	 W736thTs8aTkOu9d21+KQmLaT0iXGG/xlzFD2uqMchZMpHxlKkUfINzrIvxWPCqddd6KK
	 nebm9P5Q7Vci/EXVAeQ5LdL7HRMLVtC6ZgXNNrj6wlz68EL7vxpomNvToz/Y3uNhc4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zDvPfFRo3Pr4rD5hC81MDhK2cGrLFWLL5uDGpA+teSE=;
	b=dRsAWMiPGxGXQJrsjzQKtCkF++g+rrZqp8prQQPWgOw8OvUMPQ+e0uZbO6sRTkwdMKby
	 GncKVDF3z6v/w7MDDoBCau1uNfKpViWlF1MIvLtQZLj/ENdMIVFSvjG2Xb0Ov5tPy/1XX
	 ufeWHnARFVyr4UO4vpvdnwbiNgzqkC9KFdn849+XohDsbu+XDIQXVN25+97a4/u9tJ720
	 V37LEG2Br4LZMLtsj01nyZRIxHW1zr2hNvoSxLkd//wLh05eL1t4ejMwdf7FhzP0IrWu1
	 ao0/2V1UZcrxpx9DJpfxsKs5zzxpAnoY3OzhoS9xFJXg6K9GvLjNUe3XRZwGO4hHpgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pgKCVaYM;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB83606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB83606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pgKCVaYM
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0cf2c0785so41286727b3.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794458800; x=1795063600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDvPfFRo3Pr4rD5hC81MDhK2cGrLFWLL5uDGpA+teSE=;
        b=pgKCVaYMmSN9Q0Pcz54NxSU6NNeEydxafVy5qI4A5GsCJD0sP6S2CdBDZCo4DgZmlH
         qKM6Xbh0+05zNkgEeA+JD2f8ZIL00aIW6AjRES7bvoImI9d/if4KjahdLDh3zfp0fhf5
         3Qew3wrmf4nPjXAaRA6CQI9kAv2ouCglE6kgFq/cgVGLUMLDD7IZFUD7ZID6qsLr38H9
         k4xarX1JWekftUl2dX/3XvCcJ4dLN4NxDY4JehCU/uapuNH6FFYyYcZyUBq/JtW5YFjd
         CZzmTvfUTWkrty4BBwSl7AgiQbOmXWIucACqsQ0VB7MUtfUr/mB6YKGV2nzQx3Fx0h32
         mGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458800; x=1795063600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDvPfFRo3Pr4rD5hC81MDhK2cGrLFWLL5uDGpA+teSE=;
        b=RqBNtHcisecojTH/Va+oVkO94f4dZy/LNFd93554Tx+PA8A83dLfTcM37C9u2JGxd7
         EWi+JWyqp7J6YYqhIT+rfhqtfKGzB2I1GcAutwbci05AsLvXiUcHc6uFrUyAhmYMngQo
         JOT9xRCPnnX/U66WAAlqUtswuY3gMXch8wKxJ7tfarroMlVVUIGKZQ7nLSoR/F8t6hzB
         2dzmBiri8ys4FQEcqccqSF++aXvygTTg0elUyPBTwuw3Hwmbai8TW+j19wFPVQG82o8m
         SVESFTfnkaxs+XEoQSm9hZx81OBUbJj0czmslJZGNmndyqt0MtVwd5OOxUHenZ5hYtth
         vc9A==
X-Forwarded-Encrypted: i=1; AL+hErGsHUgd4HT2qdLQjfya4MsjPrWK4qmj5j4lCQxItVRw3ZCVszEovoKFN8dFV+silKxeMVwWwLst540WqA==@vger.kernel.org
X-Gm-Message-State: APuU4Z80ao4RtUE0vgW4au8w+iipbZFiIVQ4o2/UCzs54SRtHqt8l8zh
	0FJ6RMHSVuBiWQvcY67hk2rSJ4MVu1tQW6HgXV3HX/3N0/OgAW5D1NdgHE7WRWzfruw=
X-Gm-Gg: AYBFou3yIiqCHmqyGFCaprun7PVupv9ONZm6yV68syrm3kb7s7PN9LjrZwseIEwRTKe
	0ei6fU8DJKp5LwQkpQqdZoyrJr1UVvbzoMjIgJFlRXxm2EZzduQgOO5XkNdYFeaG8SuIPAftryM
	4Dgjhb94ORoYS93lU87AqJdWcdkh5jJ8IV1crQfthAQGpw7V6ZvFQwP5XE2tHupeepPCprfa3T3
	rDdCKwUfJMQKiasSspad7Z1LIfFzVXWODZ4g9yzeS1VuCC7NpSdJOdByUt4VOU4mohfrPXqeV2n
	R/y6SSRkq8NsdlXxi8k0yncdARmjH5L6gzwSDI0tnVM4y6doeexrYMW+3yogFP2y4UvgMABbpyT
	ZChmeSlyplYmCnUfY1+hL5xo6WeRgGYOEs4ZMjZD8IbzXM65mQgst5FDjhko3DhxsCvvF4tL1zl
	6RA8r7yNCSYc5sLHo6ZON8XDpXX0FoZB7b0nnF8e89Za3TLIxBXfB2+6oSRhP+Kjtm0Q5cjm1mx
	f9d8S4gwwKLOTC+Z1J13oce6jwp3o9//QtjaEmvPI1c3AL1mOX7OktsXKsGFqa5RAfUfCeyfUch
	yIbc8A7ySxVLR4Hxhz9ARYoXcsPARLapjdI3NjbdoCHWXw==
X-Received: by 2002:a05:690c:f95:b0:8b3:4a7a:599d with SMTP id 00721157ae682-8b3a81c2304mr30059597b3.86.1794458800536;
        Wed, 11 Nov 2026 20:46:40 -0800 (PST)
Received: from myarch ([220.149.255.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933e0d01sm61919277b3.22.2026.11.11.20.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:46:39 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	JaeHoon Kim <jaehoon1744@dankook.ac.kr>
Subject: Re: [PATCH RFC 0/1] ASoC: rt1320: LG gram 16Z95U speaker works with the BIOS init values
Date: Thu, 12 Nov 2026 13:46:24 +0900
Message-ID: <20261112044624.4395-1-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112040143.6945-1-jaehoon1744@gmail.com>
References: <20261112040143.6945-1-jaehoon1744@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: JaeHoon Kim <jaehoon1744@dankook.ac.kr>

Hi Shuming,

Please disregard this RFC. The BIOS init values are not needed: the
stock rt1320 driver works on this machine.

While narrowing the register groups down (after the Sashiko review,
which correctly pointed out that my table dropped the two PDE23 entries
and that 0x1000db15-0x1000db23 is the same command list in a different
order, not an L/R swap), the baseline with no BIOS values also played
sound. I then retested the unmodified v7.2.15 rt1320 driver, with only
the two ACP patches Mark applied, in three boot scenarios:

  boot                                   amp func_status   speaker
  cold boot (power fully removed)        0x61              works
  warm reboot Linux -> Linux             0x41              works
  Windows (speaker used) -> warm reboot  0x43              works

v7.2.15 has no audio related changes compared to v7.2.14, so I cannot
explain the silence I saw earlier on v7.2.14. It is no longer
reproducible; it may have been a stale amplifier state left over from
my earlier experiments. Once (also no longer reproducible) the RT1320
read back 0x81 for every register after a warm reboot, which only a
full power removal cleared. I will report back if either problem shows
up again.

The remaining open point is the one from before: no DSP firmware / RAE
files are loaded for this machine, so the speaker protection set up on
Windows is not active on Linux. If Realtek can provide those files for
the LG gram 16Z95U (SSID 1854:056c), I am happy to test them.

Sorry for the noise.

Thanks,
JaeHoon Kim
