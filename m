Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3564134D4FD
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516545; cv=none; b=CR1jac1dwYeO+uKbFwEJNid8IDq/fGGBgl3yid3pd5twp41J6wC7uy0M2FDrTLrk9v5JXkTlGVDFf43kwRaMrF0/YzdvgfBIzKunPLpJcR6SF3kjzqEEMpwfIL6BcOsxibyYgPpWrAf/EtbyThmtxVjPt1NxBgdJKvdeHVS4woE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516545; c=relaxed/simple;
	bh=+ilUKbu2ArLEGVUyAuSkij7jhAzxKx/xV6YfmxWnTAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CaOK0Oa2XDVnyTBoYrJZ3fvKSYD9k7ftpYcmox6WCuZyrgGKvjBGIdZxNQrvXKAvjE4g8S0hsw4JUF0haoxU/5I7ItZm6jr2T1ZQk5oK3IwYa9nelTJdRChI0EqXW3FxDwILR9jLgW6meT1KHAP6IJK5p5W1+tcCs3NGFnJxJg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V53ynsOn; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V53ynsOn"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so5209966f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 04:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769516543; x=1770121343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MBhjNvO9uP33cA1otmnLsn1T/YWSSVCvR/7qKxO/MI=;
        b=V53ynsOncXMPjhUQR2KH4KhCdbnxS+sBdxtBksc3Sue2ABFZuz7X2vIH+axa4HnK9Q
         bz/EjNQec+LjYGx6Ej9Fe50Gqz42ZiCEp9BYESC6LzUI16ExM06bTaYjiHKO9SN7SlPf
         dCkeW3Bq1ZUnWUsRpF4Ph+mLxDFgKlbuf17A+MTnPgSgSj3FMTpJLS8vwkTOrn/47BQ1
         YRaqNqSTs9WrtW6Nx1NSiBq2SD6vmYo0IqygEF9mVdei7LRqplW9EVlakOKFyPq08g5P
         I1m1hvpyS8ZjYFiedLdu6uXZDV2bgERKvmTNhA23+Ws4y3AUJLUN0f04o/sLLr8aAxGR
         xP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769516543; x=1770121343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MBhjNvO9uP33cA1otmnLsn1T/YWSSVCvR/7qKxO/MI=;
        b=cxwprLYIH/2e172Uo3N2AGbHM6IH2HaKDS3GxceMS3gr0H1hf1Rveeh7F3ArgFq5rV
         Gn5EuRn3x5yk9XjqDWYS1j1GJfdtskZov1wE4lMaAmIuEaGfoUsT8x1jWDFNfL9sAvzI
         n32coHn/89RPPYfmPn8lKx85vfBeUrIEYNp3x1fKhg6MzDd6LuyzsJbk57gJ2xzizjpp
         k08+nmsXgircvF2/AU0cn9AYbT+9V8Pwmfyaye2SYdR0M44En1wdBCpdA1cGp51cgbJE
         N8tzOY0B8kwxV901gU/p1vCLRDNoHGf8zNhlreo2DT4qjAKrJq5MO9xVekeMpuZSUPKj
         b9wA==
X-Forwarded-Encrypted: i=1; AJvYcCXxxJkLZBy4Oo9blSdtq7l4FgWSUMnOB4GSPpYxmuYYclPUWSzqkilXt5ts7wstcYhQsvnB0xRo8J0Vxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJsxueJFT0zG3yL6YUj2C7qxq0etFIu9s26jr+IUNiQUs8+JbZ
	vbYyVyY1zjmbbIHBVacM17t+hjugQlbzUxHVBjK2+ojyIMADJ582T8BR
X-Gm-Gg: AZuq6aIWwEEcHeWjTC7yNsmg+5tu1S1QTmu+mgSFksS13KZiTdMY4wFsmMW61tbMgZ+
	DEEK2xYhWsLnmAIq7SR3TrgPdn0wzHXAw5DhXDd+2P1t0JOq4sNIMGjZUYn9DqlPWM0m+rRWuHN
	ci9MYGrFHFWn7YyZe3dFYF6+QPjZGAyrClE47AW1ZvzzcTK4s2nZ4/4dbUny0L35652cYrqu3AE
	kahtnWkYlpeAXxiKi0LdHNPeW3vx5BG5D1nV/rGaFppiBPbVJvtuyubRzB0gEGyH3V4JMCyHIAv
	z7LSaJXVAwYUiNkgG1qLE+IZewkTbIhqyZc/PbkflV6loK5GbXJJxBInNHe8CycdoYFcruVp/mi
	1Tyu4ltVlocDcMPFihnRSr3cI3CpcXBiP1KvG2M4ULiWXo+PDWb6RsfvAv6juqO8C5pLKWE0rOE
	fFqb7ca5TnQJ6GHHW/aXqQbY3FTx1+Zpag/P4DpzN3nf4=
X-Received: by 2002:a05:6000:178a:b0:432:84ef:7160 with SMTP id ffacd0b85a97d-435dd022574mr2376326f8f.12.1769516542309;
        Tue, 27 Jan 2026 04:22:22 -0800 (PST)
Received: from [10.25.216.67] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e71503sm41885074f8f.25.2026.01.27.04.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:22:21 -0800 (PST)
Message-ID: <c4f4a6cf-8511-44ac-8648-d8c4093e24d0@gmail.com>
Date: Tue, 27 Jan 2026 04:22:19 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
To: Frank Li <Frank.li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
 <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
 <aXeY44T+5rvCqBs8@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aXeY44T+5rvCqBs8@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 1/26/2026 8:40 AM, Frank Li wrote:
> On Mon, Jan 26, 2026 at 06:55:37AM -0800, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add support for AONMIX MQS (i.e. MQS1).
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
>>  arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
> Chip's dtsi and board dts should be two patches.
>
> Frank


What's the rationale for this? Is this "rule" documented anywhere?

IMO, the DTSI-related changes are small enough that it doesn't justify

the split into different patches. The split would've made more sense

if we were touching more than 1 board.

