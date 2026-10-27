Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109004;
	b=31mYkBwdqoH7nDyGlNFuqv1SR/5TwG3+YZxlDV8gKewI5TNpl+q9mGJ6oIy6dthXNN5X
	 kNuWhvsQL6/Fg9T9gF6hq7EaBR3OOXTyYjXJNEvKwJ7f9d6lvWUUJM7y+RQCIhQpWTOVS
	 PMgmED9Z8ndEG/vJIbs0FHTDTPguARzoFiJ3HGj/CPgMxE1wLSG8Ul6Ml5kRGPC1bXx8W
	 AbL8Q3Sq150GZe+S2XNJ69VyJgmDfWG3/tOFm9tpGLg/90WvXmLhIojOmkymrMULKst0x
	 6H7HEnftxEUs+Abwc0yXl4uaeMGlUbYYq3ykzd2n1903lz4nQ0it1WJvRwuHNGtw+kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
	b=lRlDaL3RGGDLmXULFNKCqcnaui+xaaw4MOvywgBJRH+48Bv7nhd6BzZmYGre+ro2OHzB
	 eL9WNlehXR0pIuNSRnae4hZHCioHUMPfkZN7ZDzNwW7/tG2xXXISQEovupwpA3AEeDEZR
	 8mnN30SqN6mJjkAI9j1zRy+WcEc+wLueEXCgekZevz0pGoOUYwPK+ihtlSLkN6jUBNtaV
	 3RuUc9LdnNr4PbM2hhGwMtILpfa3uS8577dHVGfiQGQZR1QS2OTm4V2SKHvJ2tE8B0uBa
	 DsyoJ/JZs3qWtvtNHJ8rEti2a+Q0+FwlM/IcpUtpClevP1vg2SnAa81WSxuIfTlqofQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDTkuBxG;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26192606A31B
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26192606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDTkuBxG
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e503815adso442765385a.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 06:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109003; x=1793713803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
        b=gDTkuBxG9wEyZA26EZszhG9Uh/3rX/19W0sqMYQTMrJDaJUmzcVQj8Q5vsjyJxkhrZ
         ej191n5HdezQNZoWYNpWjnSH87R+ugN3VQYeIPp/zC32VuxNyAMnkNWAKDZgLSlOh8WE
         RdAuF+Zg1uwYuVkS8mWy1z80DBLeT2FyCRuFH1gvw0MbLw1U4udivwWLPpPvGFR2Sn7G
         NkXmzdCN/4KlmwzL0WafjR6fS4/vKwQlYLNnxgh5F4QV7qFrZioFlDVVQ2/1mLd/v99A
         vLdxmNi1B8dVQTg+3RTCB2njXv82jd1gXawVzEov8pDFcu7Boxi03mj5uhtfxinaBtPu
         kBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109003; x=1793713803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fcJsJrwZVJpubHjDh5HTiiaoxTH17N3RP/rmPOz5xY=;
        b=Kp6/ps1UbhvdFb3l0J1txtlVmZMi1owELTsizLXtuQ0UGEJxYfWoQkKXyLDmntQu5w
         FT/arsQYB8+KdI0OelkYG5G7zJjcMzOEJEPc/VCAG9QLsYhcwuPh3xb6kpUYRg0IPMnz
         IMDNMTAeA1QdNU9j4m0RPOvBFnoxy6Y6jDNIbBL/jf37K4D5ia/i5YVA3Qlp02TR5CBy
         nAZzHixyNwV8+iF7SLDC4M7XvAqjLhuEfUL5UkC6sSODWhN8u9VOvQ5A9JhsYHexNqgu
         g99qj0wL6nFgjWS1EkdKP1h/viQLvIEmWnBjwa4VnHaTW78HBVy8+Kyd6UeQnm1bz6HG
         bH+A==
X-Forwarded-Encrypted: i=1; AKwUvBxbuffU2ol4jksNv0QeRE/duMKpTwXjGASWw9OqRPndLeehKc+su1bve8OZSWwivxJQHW/wDT/EUWeuBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJsJSrQwmEARsM2HJV/L7x3SJFOaCPR+4jMqdZ2csFaHV3rBKT5
	hpT5gcZA6dPrH6Le2lUbi+zDItIm3BxFSKuptTDIipZZwklZQz48ABbu
X-Gm-Gg: AYBFou2Qszvuf4l6u5UzxYVQJLaTCdRlnUpWhYVTYWMoHDaagtHLRcv72anQWWw6WoJ
	qBTF8J47n7nV7awZJGcf2anSptMtwM1cSRlN08GWhomsFiX/pCGFhzXg3WKy1RQqNg7mXwxTZY8
	D1ZEyyXHfbZ35Bc3kxjojQZfYj6b5R07/xqoz26vLWxXJ0US6U2FjebOAbgTYLunoNmrvkvIXzl
	tdrPCvVtGQSKGtAjseiuzMsX+AR3zq5G7PteWh0hqt8R9/5e9S93SpekUi0bR5Xf5Gq3GeDx3d4
	CrJWa9W6pxe0vo5wlMluKxaPdOzTZLn0RhGSvD8KdJjJxOdiJZnazwTKgEZc0bDo8nOKBKtjBje
	vKvX9Qsx0fvA67mZg2OyvmZ+N1H8sRHCThPc6LL2YW2yBO+JzZvCBXjr/b9YJNCmwltdr3Gv/Pb
	uPdfcpGaIzpLP6SITPV3A0O8DXjeZvBTz0bfCyIqXtQ6B5jzJ99v863OT0K4FIHB8SRZmsQSdg2
	b23tL9OTdIPksJqN3fCtc5HFkIqgZBB1vFhXQkPfdbvm8aN4YL6ZFZ54w==
X-Received: by 2002:a05:620a:4152:b0:93f:565f:e40 with SMTP id af79cd13be357-940ef98bebbmr1567887685a.65.1793109002941;
        Tue, 27 Oct 2026 06:50:02 -0700 (PDT)
Received: from localhost ([141.117.117.39])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b1adbsm978781885a.4.2026.10.27.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:50:02 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:50:00 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
Message-ID: <auCsCPL7gK2lIR5q@rdacayan>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
 <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>

On Tue, Oct 20, 2026 at 12:37:36AM +0300, Dmitry Baryshkov wrote:
> On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
> > The Audio DSP (Digital Signal Processor) is responsible for audio and
> > sensors on SDM670. Add this, along with the SMP2P nodes used to
> > communicate with it.
> > 
> > The sleep state is included to prevent the following crash:
> > 
> >     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> > 
> > Otherwise, it is unused.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
> >  1 file changed, 168 insertions(+)
> > 
> > @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
> >  			#freq-domain-cells = <1>;
> >  		};
> >  
> > +		adsp_pas: remoteproc@62400000 {
> > +			compatible = "qcom,sdm670-adsp-pas";
> 
> Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
> fallback here? Then you can drop a driver part.

Actually, looking at downstream, this should use the LCX power domain.
Can power domains be omitted like on SDM845, or is LCX important enough?
