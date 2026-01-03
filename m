Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A6423D7DE
	for <linux-sound@vger.kernel.org>; Sat,  3 Jan 2026 21:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767474721; cv=none; b=c6FaQ7IJYrDrQoSUUIz0KHnuakD51lMbBc7XuNk1ecW9o9ewaJ4gi/dHqn/ZmX0uJJU1dzgsNcKKKS51G7s/hitmF2vzYb8Sm30KQMeucLXjSAf0jv1NQ7AKbdXScYA7gjKEKNKNEFvZYG9aZ4H+/VDQZ0HRkIYiCiBzwhFKRt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767474721; c=relaxed/simple;
	bh=zkzZKcyRoR6rSMFbpcsEPw3jkCnMNSmFVQhdLwJKWKA=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=pGRbFkY17p2H5kCs4Y7zwyz9t7sShRYiGSxMQ3dK+A1x+iwwCEYZTrTjBh2MPoBEA5+uF1EbkCLK91G9E3i/9Ts62R+rlBXSmPgCdrp/HLbdfppxdH/SQ3/LM5rk+tN0WHVflJhT6ub1tTkWWCsqBy4bW+X5iYAn5RcBrDHtEeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=TduQIY7l; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TduQIY7l"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64ba9a00b5aso15309012a12.2
        for <linux-sound@vger.kernel.org>; Sat, 03 Jan 2026 13:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767474717; x=1768079517; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:to:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wvls7ej8rCewPHwhQU4xvPOU7RdTESEFmiljlQMfweE=;
        b=TduQIY7lFWnvEQayV2QFtEKldLMQ5hueV8Do17s6JPGvKWCiK+eWMpPsNvZjQvIldY
         SB1xFVPzoP6RwxeTv3EOud9n0puBkKqsWLdLhUUZ0za7klLBS2J4TnTwZ55w0hWoVfGB
         FetjN9WlRB4Q0y769XQD5TTNuZxPaBz3vHITd5oLBiE4DZQRNE7U7oslPEcXq26q3opI
         VpXyak4odpp9BUxVu5va9aagxQ2qUd0S8x/KcPgT2oS96ywAPiaUgwzTIH2KhT24Jzfx
         WAd2QM5xftpkazdZ7e0yFzn5ISzXi/TRXtKSdPArtoqv3wZorkyBomGBg7N+ho/GodCZ
         N/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767474717; x=1768079517;
        h=content-transfer-encoding:autocrypt:subject:to:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wvls7ej8rCewPHwhQU4xvPOU7RdTESEFmiljlQMfweE=;
        b=m0AWvh8/t4ghfPXI2Nug9+ovFTtcUM9JQbTZyVoIarjV9HF+o5Azh3ZUS21l+gYmHo
         2/x+w0TjedNSMJm80ylNL5h8ZRoLaDN3q9jnIUNJh9d8Znmz09HrLxj8PrSPMeax8qOk
         qVYzgatUBvWEFYVm8s/8zjlTD+PUz5P15DEGef65dpj/z7bPvThZpi+Ldz3si81Cz1z7
         wRGt4MhVKjGMyMcRNdWIQTa2sM0rl4Pqwg3ZxzXutf+CDowrod8E/+koHCQsb6UHEurA
         GsUA6KKLvTMTQYGRXpOGTGAu6ReSkVtwEcvvsrvqSIIbIVBMqEUMzP+haVx/Y0msBN4l
         +Etw==
X-Gm-Message-State: AOJu0YyFvPIKMVpp84FR9Ao/XtyNAO8OdlnATzutazWM6+C8oMuToF5O
	PTywWqbYTqISNqwII/mgT6a+Pdypq6UQ6L79BjlRHcnMWgohVl6sCcrASjNHrg==
X-Gm-Gg: AY/fxX503Z+RdKg1VdKpW1C/s0EG2YExoWc08THufc+IWm8APlxI84uL7DZxauPNc91
	qq/VqgYMXo0xRJt6QL7EAR1VQNCldg7D3D0vVkMsm0DSl2Ph6/0KTmNqjDVP6EF9w36dqMKkkqM
	CY5t/NboG2MJQtoFGYZigc9yhUH4/XVlfyK/oSKF1DQHdFAoOtUNZfbeY2ampMotCpovt/Macd0
	1x7SpVpmSLCHyH6Uez8oREThSvFk1OubqcacTDhqMXheEYgkhGHB2LIvuHUQD01irSa+BMAhNen
	NsjPwaJ4TwOV1lyFSdfXwRWgxIeQKzPl4ujgIjObi2iBtmzoTSIoQghhMqJcHF56x6IUmO+aamn
	ab1hYazk1EpGEB6+E+kd7Ka5V2jEnkpy1d2s5D5xurL+7Jfu3jR+52mLA5qJAzJ2XBv027gl24I
	d7gPJ61Xvk5wCqGDnIVhNAOg1x2oZkWsY39Wv97/uPT67KTzYGGzmH4/+p+4Z4xAmnPTtxxllnf
	PmVF8VuMRdvul7TVeselFF2H2yKvpzKOqXETN9F1UdVApoooXoWzcF8WT+TjGzYdQcd/a+45g==
X-Google-Smtp-Source: AGHT+IGg1l1GuXVQWDHtsW+HLWIx1aE2Yn18c00nRBQgPKK2JULpM++IFbGePFB4AsqW0oF2aFKhYA==
X-Received: by 2002:a05:6402:5641:b0:64b:4c70:a5f0 with SMTP id 4fb4d7f45d1cf-64b8eefa8a6mr28970801a12.24.1767474717185;
        Sat, 03 Jan 2026 13:11:57 -0800 (PST)
Received: from ?IPV6:2a00:6020:9cc0:fb00:83bb:55a3:d87d:3401? ([2a00:6020:9cc0:fb00:83bb:55a3:d87d:3401])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105655asm49067139a12.9.2026.01.03.13.11.55
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 13:11:56 -0800 (PST)
Message-ID: <3da4b3e6-1c4b-44d3-91da-640d34d22236@googlemail.com>
Date: Sat, 3 Jan 2026 22:11:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, de-DE
From: Oliver Freyermuth <o.freyermuth@googlemail.com>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025),
 0CCD SKU
Autocrypt: addr=o.freyermuth@googlemail.com; keydata=
 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
 fze6jkGoKl/JP9K8o+RRag==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This adds the necessary quirk for the Alienware 18 Area 51 (2025).
Complements 1b03391d073dad748636a1ad9668b837cce58265, which added
support for the Alienware 16 Area 51 (2025).

Signed-off-by: Oliver Freyermuth <o.freyermuth@googlemail.com>
---
  sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
  1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index c013e31d0..f486bd74b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -749,6 +749,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
                 },
                 .driver_data = (void *)(SOC_SDW_CODEC_SPKR),
         },
+       {
+               .callback = sof_sdw_quirk_cb,
+               .matches = {
+                       DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+                       DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CCD")
+               },
+               .driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+       },
         /* Pantherlake devices*/
         {
                 .callback = sof_sdw_quirk_cb,
-- 
2.52.0
