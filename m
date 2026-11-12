Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794456118;
	b=QlM+62S8MWRoqcxDcnJuDpE3JSdWAQwbt6fDe7Dq6YYuWFbZrFq54hwn3IMm6qBuzgDI
	 hB3mgPpVOhNUN53qlxun71BPVFQAM6oDO2qZCMa76RF9aORuVXC3SlNkjZX62FY5yYJeP
	 Ndh0P0tdlOZJUb5cO8jvZAWV2xxFEq+tF43jBcRyNYcYw1j7xybrzm2qK+QHIBjs7+f0b
	 g1W41oqn5LjDtvIgz9ElghGwRQ9+nmkKde65tvLPUK0WisdNS99z3e1GnLi1JRHnwPlnA
	 wKrXO7wEWkv7njwgbALZNCLOUqqlCedB4l4SMkE4VypSw7nukw136UsaBpkZmmCZUOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794456118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6Eh5gMzjLNrE9pzuzA3bYCBZpoMbXdPIaF66JFz3LTM=;
	b=QB83NnFMqRHl1B1Oc3OeAtjweKgwFEEIPOGlIxufHeZazGynOkMvFKy9D6zF0QtMglT/
	 SQJgGgIuIZ7/Lu4dcGlldISk7N5P7AhefhL6b2k4KMFH+K6gu+JmA977Y9gC2rOZkg1qC
	 wCrTTpRUzQStj28NlIvaMaQsXoH6+nwPoBwiLgQ9mdI9cDFf0STCu2NaIZTLCRJ3XJQUu
	 nk6LX1S387s6w8UDeR5/nNAG5mW3D0uW5hcPFyPbey5Nhneismx7JcYHaEhOd0wFUgliW
	 5l3ArCtBIEO32P30xca3SqQR3k8Xr7Svjg0xtgiyQIAKOfZ8XTKz8DNbXrTQjaoDiUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dankook.ac.kr;
	spf=pass smtp.mailfrom=dankook.ac.kr;
	dkim=pass header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KdAKyYMu;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF1606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EAF1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dankook.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dankook-ac-kr.20260707.gappssmtp.com header.i=@dankook-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KdAKyYMu
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67bee1f693bso3541642d50.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dankook-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794456116; x=1795060916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Eh5gMzjLNrE9pzuzA3bYCBZpoMbXdPIaF66JFz3LTM=;
        b=KdAKyYMuYZofS2NMibKZIgNh2OtbF9bBkLbZHhk1ID6gsVSR7oqpDEVNXLv2HOIPBU
         Ovr4fG6LVHA2GpaVMhEvkJxH0bRlRcKsrc9XNALo3ty5njB8kJoRxjeDZXHTnuH/gFYI
         c6cF3h0VkpdaFm8W0UtN38l3geZeK5SjtgvcIKSwOFc0oVGoHCVF2t3p3R5rWhowd//z
         JdS0sFR/vJOJwVqIuAILZ7KaRQ6RvrAcmH4VFkikUiYsPyNhpCa8w/YxpqLpNkrqEgnB
         ZhizjJ9Zgy8gUccaL5ZumXMF/nFY6cFEqBlvkYt64HEJOvXVyjhH6x4Se2j4k52b6Sj1
         qygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794456116; x=1795060916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Eh5gMzjLNrE9pzuzA3bYCBZpoMbXdPIaF66JFz3LTM=;
        b=vypDto+L5iEtshlQgCLNWY0PsNP+ZCG7Gyvh05zIbwmkjoKD1nVm8MWUSo8DRQoDgv
         nmow5V+oDzFSmGL0G9oVnBhXHpPTn4LdO+fYRUbCBTKHdP6DoI7qivR85jc3WGRCXUfP
         8K5yjXjLB9gxHOpaWIfD91KPhhPN3HutE+rhUrmScIDn4XxCirwMcF25BWwHor6KJAaY
         5J9liIHr9xtdJCtp9oFcIiTAi7REjP8A35RZnhSv6a54yfbTrnPH0BoT0PyuNPWv4K0u
         ilur5tvIA8bA2OeY4uJ9vIUXzWDVdQAArT5iDxFmJZ1Xd/I9xEJopMEW86W0EsVB5v7/
         mIMw==
X-Forwarded-Encrypted: i=1; AL+hErFqr3UUaPKPUznHJHDjNC2hiWJpp1lTSvKoHS7eEM3e+KEZpyVnHvWwiux+bYbaP9cFHNIqNxcSAbO9QA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9e3QdMtR2I5prZ6bAZPh3e0RQVq0a+jXybQ2J8CfaH1/Pb85co
	YELnRDzw7KCLuqqLbL7zDlCiRHPF2AhiLhtpIj0FMtOyrVXkiTq4T+iOmylABTdm+TQ=
X-Gm-Gg: AYBFou1Pwi1jQNtFD8kk3cQlERb/GFyTXcTLKrCiy6lzhIC5MVLOpibQQVQBJzcjrLH
	fAhXpsRYCUzwl5GMY0gSX4HwEq8U+GquqcVZVA7CcNU5bGhudqlh1ocRVmpuTB6y8PguvqKhrod
	0FwWH9tavrJvYh640luF4VgQBvUu8+TbatyXuRWssSwY7Sx9N6KthtmB3FlTnXyJLuKjRrzL5ZC
	h05M6AD9OiqwR5iDZHeAiU1d/OuzO51GJcS1AUJP/qbxp1cLmuteHhLzgXmqNui4WUhaCkacwXM
	o56q+IAdPVVBCKRGf9/1wfviOm1cqtiShKYMRnCH/rE7MrGZGgobrUDD98BjnR6A7V9HjqLlrOQ
	u0dWooQNRicFRtw//2VYhTtmc7ewcbdyGmFI9VuYo1mJwSZuMqmfNrvy/m1yWCIaSHuLnJizGeY
	ND+lG8u2Og9QjKKUEUePVCnc1MWccDHAS0oS6ye4WXca1PGRoexBZBwb26DN/p/ylLmpbYXRooG
	KLq+uOd8Zpydvd8Z5M9lnl1I3HxzPYK3i0yAddAwOVJ2TMI0zLZiVYX6p+UsgNxm/HBMkBJUaWw
	EAxsQ6rpfjOBeXwo3Lrxj0xY
X-Received: by 2002:a05:690e:4505:20b0:679:fa73:7313 with SMTP id 956f58d0204a3-67c67effe84mr2408584d50.22.1794456116554;
        Wed, 11 Nov 2026 20:01:56 -0800 (PST)
Received: from myarch ([220.149.255.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589cf1fcsm6209654d50.13.2026.11.11.20.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:01:55 -0800 (PST)
From: fixca <jaehoon1744@dankook.ac.kr>
X-Google-Original-From: fixca <jaehoon1744@gmail.com>
To: shumingf@realtek.com
Cc: broonie@kernel.org,
	Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	JaeHoon Kim <jaehoon1744@dankook.ac.kr>
Subject: [PATCH RFC 0/1] ASoC: rt1320: LG gram 16Z95U speaker works with the BIOS init values
Date: Thu, 12 Nov 2026 13:01:42 +0900
Message-ID: <20261112040143.6945-1-jaehoon1744@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111013953.4011-1-jaehoon1744@gmail.com>
References: <20261111013953.4011-1-jaehoon1744@gmail.com>
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

Follow-up on the silent RT1320 speaker on the LG gram 16Z95U (SSID
1854:056c), from the "SoundWire audio for LG gram 16Z95U" thread. Thanks
to Mark for applying the two ACP patches, and to Vijendar for confirming
the AUDIO1_TX pin.

The speakers now work, with one change in the RT1320 driver: using the
values from the BIOS SDCA function initialization table of the SmartAmp
function instead of rt1320_vc_blind_write[].

Results on 7.2.15 (version_id=2, dev_id=0x6981):

  rt1320_vc_blind_write[]     stream runs without errors, silent at 0 dB
  BIOS init values (patch)    speakers work, correct L/R, no distortion

The BIOS table has the same structure as rt1320_vc_blind_write[]. The
differences are listed in the patch description. Two of them stand out:

 - The L/R mapping in 0x1000db15-0x1000db23 is swapped compared to the
   driver, and the swapped (BIOS) mapping gives the correct channels on
   this machine.
 - Several registers are written only by the BIOS table (0xc5c2-0xc5d0,
   0xc050-0xc063, 0xc582, 0xc60b, 0xc682, 0xdc20, 0xcd00, 0xcf02,
   0xce1b-0xce44), and 0xc900/0xc901 and 0xd471/0xd479 have different
   values.

The attached patch is a test patch against v7.2.15, not meant for merging:
it changes about 50 registers at once and I do not know which ones are
required. DSP firmware and RAE files are still not loaded on this
machine, so the speaker protection that Windows sets up (R0 calibration,
EnableAdvanceMode) is not active.

Questions:

 1. Which of these registers does this design actually need? I can
    test a smaller patch, or narrow it down by removing groups of
    registers if that helps.
 2. Would you prefer the driver to apply the BIOS
    "mipi-sdca-function-initialization-table" in general, or a
    per-machine table like in this patch?
 3. Could Realtek provide DSP firmware / RAE files for this machine
    for linux-firmware?

Thanks,
JaeHoon Kim
