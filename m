Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0C44A07
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 20:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777148498; cv=none; b=lmyflaCI6y/GyvJsNHD0BdlSDHt0nQd07o0Hu8pQ4KHkyhDNzcOrlpmHNetXI60/naPxo5svLezFV1sPWjNyfbAK+pw/Ygypx1FSayqRstH2/2T0OeI2vmpTBeSNjRgvXw7rTpN/20j/Z/kk0NtnydQrq0pUaVK4Vf0yJfo0dYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777148498; c=relaxed/simple;
	bh=0fz8/k4k7blC+UhK2bvX1ejQhOxXeWzxTNq6JixBC08=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=jGiOWcDg+ggkDueNWsvZ4j3j4w0mIc7SdM+W44o5Us7hj7EJRZARuHwg9gDsZlLz8YdGH6x8CfZyc4MSYJ91s06W05Qf21t+eLTOw0h3qXSn8fFPdb5HraQKMi3IeiKusrx1w3Dnjode+MuXhHj+AypRtfFrkUlhYJ0LmYWMODA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbOvCCs8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbOvCCs8"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so8654981e87.1
        for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 13:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777148495; x=1777753295; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fz8/k4k7blC+UhK2bvX1ejQhOxXeWzxTNq6JixBC08=;
        b=rbOvCCs8AcatKIie0Meh09ZPeaIPbTGcWY67XDuoYz/qSSNR6csE2UCtOlo33BCbAL
         Hzw6VMe7WdamVpYVkt/Xe05qyzlWFOCx7bgw4oPhq2kbKTSBLBPWWShIk8giGXl5ThzQ
         qICoEb86YoKv0QMUdYytN3R+7aPiAG5m8oO3Jl0fvxPN+wEEVa1GGXaaWs71j6R1KrkG
         PPz5fzDJRUIReOs+v5WJDge326jOocIkR//O3lTIRouPfRWr/JWTmUKgC7JOLV7VvFSF
         dHexPbIMKMxpYWL08hUVGsll0+3T4KNGSKLRQRha4+UZ4QS9nQ1/K4mD33uK45UC/Sgy
         4uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777148495; x=1777753295;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fz8/k4k7blC+UhK2bvX1ejQhOxXeWzxTNq6JixBC08=;
        b=Oc7kw/9VE5lmXscT5wpC7+W6RfJfCW34wzcV2VAOIWM5ecqVlnIdCvJT8LdifVisnp
         S7FUl3NTxGJI4vcdnKVIbwXa/ByKsxsJBCXmk1O24y5VDtKO3zw1YYAvWp3yeJ5/W9zU
         5xQwN+4kYoULHCMfDop8188FlGWaEDmDFCMsqXOBT+YAwCoEBIwR34lSnejmXEypLIMS
         7uI+jjByPtlDRlmd/xiodmYoi5CVrzRn62GILDJKKJf/evGWzlb0IxnfaKWNpGDzTglV
         epIr6pAsQamTJ3zogfE/OFzJYW3GxIydNW7QnwbnQhUgbLonegHwTpzP5+MhT8Yw6m8b
         LHLA==
X-Forwarded-Encrypted: i=1; AFNElJ8Q5FWHL+uPKK+05nplDJm3gZGTIwqHj9N+lBRZR9vfXUiTY9zzD1QM1kLU+FsaJEbymMI9SoL59WHa7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHoe7kQl7rfDR626cBktxoIIYQU1qE0uFRnuZtlWFVC9ndD8wT
	ay5m0aNkOadrRPM4vBIn6alxTkINusaw3BjjTHo+Cu6OologGP+fus8U
X-Gm-Gg: AeBDievbb5jx/iLabiQk4hWBzpyPG1r/PSnc5OPafOR90tfqnwoxBPz1hpid4lq+vay
	VAbnkryiCsLuQSsQwR1FFjk+9cTMt1XavzLeRtMeZ94MlXlEbJYbsSLjGjQhiZ5BHG8Ke1RmdSj
	cNe51iq9gOdeaWs6vdSQPf3PkRt3SXApjnfVSqyBmmKg0XKJY2VF01VNxFnfY6rEMGEXFlUOn7T
	GpnjfQexc6mdEWduJcakoZmXW8JliyJBebnL7eJCqWEppLnu7ZwpNm5IAPudhUfHbH3hkfe4DwD
	yMZ6gCUXbtxGkH/SztiCbxqi390tCvqDJYsx5T0erb8meB4Jo6rim03H2R3P088BBgrNB/rH36W
	C6qIJJYuv1g8rBVVhMwhhvGSta4+PAY6fmmM4bdJgYCy+kJF9KSkUWLvShjT5Wh+ZwxAyuMU2QJ
	fT9BwTJjIO4oUVgGwcM6Ue+BKEKaHHpH85cR+iFkce0SbVxx/zoauT5J37wExbM8Y8b5Mo+pPPw
	z+aoy6F
X-Received: by 2002:a05:6512:12c2:b0:5a3:ffca:9890 with SMTP id 2adb3069b0e04-5a4172bf8afmr10340370e87.10.1777148495023;
        Sat, 25 Apr 2026 13:21:35 -0700 (PDT)
Received: from [192.168.88.200] (m91-95-13-154.cust.tele2.ee. [91.95.13.154])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0e7sm6913886e87.12.2026.04.25.13.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 13:21:34 -0700 (PDT)
Message-ID: <604d99a4-4ba1-45b8-a0fc-b5b0d484b534@gmail.com>
Date: Sat, 25 Apr 2026 23:21:34 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: syed.sabakareem@amd.com
Cc: vijendar.mukunda@amd.com, linux-sound@vger.kernel.org
From: =?UTF-8?Q?Sven_Vaink=C3=BCla?= <svenvainkyla@gmail.com>
Subject: ASUS ProArt PX13 audio loss after suspend (Strix Halo, ACP70)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello!

I am trying to fix audio loss after suspend-resume on the ASUS PX13
(HN7306EA) laptop. It has an AMD Strix Halo APU with RT721 codec and
TAS2783 amplifiers on SoundWire bus. When resuming the system locks up
for 5-10 s and the SoundWire bus appears dead with no audio playback
(with more lock-ups at some times when playback is attempted).

This problem is also reported by other users, so this doesn't appear to
be bad hardware on my end. Audio support for this laptop got merged in
7.0-rcX and this problem has been present ever since (currently on 7.0.1).

I discovered that setting "amd-sdw-power-mode" in ACPI SSDT9 from
power-off mode (2) to clock-stop mode (1) allows the audio to continue
functioning after suspend-resume cycles.

This might be due to bad ACPI tables that ASUS neglected to modify to
fit this configuration, or possibly a suspend bug in somewhere in the
driver code. Sadly I don't have access to documentation for the devices
to debug this further.

Are you able to provide any input on whether the power-off mode should
be functional for this ASUS hardware configuration?
If the ACPI tables are correct and the power-off mode should work then
do you have any ideas on how to debug further and solve this problem?

If I can provide any more information, logs or apply any patches then
please let me know. Thank you!

Best regards,
Sven Vainküla

