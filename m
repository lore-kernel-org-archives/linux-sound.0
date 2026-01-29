Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A215224AF0
	for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680430; cv=pass; b=Sn0FRC4BroA912EkEgAWaqNPxGdYEMtguiMRzvQq2k1plK0C+kI0kv1SF69rguSX8N0xiS+N1z5jdM57wGrLAaCUUFaz9/YU9gTxDuMCQs/F5wToQFd9JMOOLy0D3FGf0FSMCyil3wrgXd1A97AqZ+w4h2AUp3dBJFqu58A91Ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680430; c=relaxed/simple;
	bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6hClR0VA5S+OmZjMPliiAUjuwhbdnff1QyQbg77uuuvIsytcPiIGFzaX25zlit2IBYckC+rhfYM3pqPEcr7HuZd0arRLkb5h9zGrntdTSsKpzf3sZ/yyAw9wdcBej3DOEsPYTdNIr6Kf1vVWjSqq4ioV8h7GUQNlJUUElmcsTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVDln4t8; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVDln4t8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a743050256so4419215ad.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 01:53:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769680427; cv=none;
        d=google.com; s=arc-20240605;
        b=MAUyb4vHVSUN3SJhzmnAui22yMM5E8EaCxtWuDlho04huW9W13TywjKzBeqnLZSOPH
         xIh8y68//cj2YzANx9pxuiamWlNbgaPHEgrUmSJWrIABTkMMV2KDoWzgUGNXwHHf/R4w
         nLjqYMJnJ7+NQl78dt3rSzMLNl86+yUBjdZtGGpYDsUlHrQY0wCN075Hq2gxFNH/HHNf
         +QQOCdw1AWFGa0Ln9ove1TOx0/EwTfIIh79S4Ypp0zcFafzlabKa1MsBQIPzQ8+lcomF
         xjAOPl2bDkvLkapPjggZxvViiXj1zqAxwisP+ENYskHc8rxIAT4TcanTBa4rJ+NROEld
         g98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        fh=xADTRO1WIFO4xZO5E8CEux5DJMxgprn1oKZE8lv1jD4=;
        b=Bw5sX86yb2cW+du7qgxZg/gslCUa2xUQdZTp+C6Xy7WCGY4eDQTDw/HPLDzEXZ5Bvg
         IwRhf1oeeWUcFp1Oq7S+tuWQOHyP1iK76LgE/kj33ZmZ/j8A6cj1lbV+pponv92cpHOt
         PhKbbfVuS6kj3xwsJTrOfbyn8c6DicftZuk+1ngzWPnQ7lwQdW1NO6Z7qTreL80F0PmT
         CaCNz+kIilH5X2+DbgPFGfAq6VDFb0Bfvj/UqqQBltv9d2XaWG+61FJpctdnaGAO2p5c
         /q4BLcyf52q6N7e2lBsBAE0dYv/3XU/JDywYYF2605YUVLEEvTtsxJp9HKmIyjBvZ+L1
         +IyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769680427; x=1770285227; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        b=VVDln4t8gSR78q9W8H7dhnzty/dnpOHAIh36ebaajTIOicGBqd1AmkCmfx4v5MMe9G
         yh9OszJ5gzmL4II+FWH0O4Lz8hqcXme54WcsJOu2ninUG4Zi415HI3pHOqprkqLGsnzR
         UHKTTz8NmaISq0pjFp5MstPyqjcWMTC1RSLOUzHUf4nsVS5aqO3j2FR3MQaFu4QTzD5F
         YqNyB3+m10i6s0KyuIKAz/XsuAzSuVhG4+4l8j0ErsC1FC2aqEkHcufY5cKm4xOQS+1Z
         AG9p6IIBEIi6gaHQHhYfy2ZNyn9yUmkrTfTg3ACoR+I7+u5vQWZjdjggg+DoftpN20HB
         nqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769680427; x=1770285227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7eUFYzBO0piSeiJwey3BFHh10mwh8sua4KhOGsFt8I=;
        b=S/2BBS9y8Mz3JcJs8BbcNz53qVtlDePMkvJKvYA7wGsssxTZ9AL5nmdNiGn1NaMShq
         VxZvEAckK+XIThaXdCRjbwAznqkkjVV48HY75Ji+jjj1kVk/Y343tEJDhnvk0BjsjswE
         BImzWNR4Bzd+JAjxQTh3nXSNLfb89VcW3l3KV8jUhWim+7vr5TpuBm3FmVfN8/LMc1yH
         cVisyB+o/kZQErZDeY7Tyxg6j9LpfMp2i0FQQRZVU89v8np+DtIGsTrW2wbxGe2/kEmH
         c35GEYYhLpNNQVPP/rd1QwoDK3aPBDlZUI/vbALXYYq59vZjHLfg+SnIwrGqqdsOBZ3s
         x8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlODB9QiQKOy7SpTqRc/UMdDvOLO0HOYWE7Fj1j93NorvYA7p+8wCSUGXgMxm8TCWKySeROPCA/wwSpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywho3rryYPtUqIXx1y2ElpZypCOg6FwF76oh+l6eESnW5/Cko7/
	dP5+OopTNlAV6Ve+HCztSbWoCSum+ms3EAYLz/MqzogF55jaYezACmZTcO7TyqByt1OzRK3riUv
	tNecM7OfEc0aNFXs+u9afux/t/Sf3MbQ=
X-Gm-Gg: AZuq6aI+ULTxbXydY3HZ6Md6FKbqALO4ekbwjjXp7LtqZ51+9V3cZ0vw6EkA2AG4Kjg
	Wis+Bdl+MOhHo/+p2yJYpc8OHhi1mFiVtgrdqpzsFdy+39bF8EslCaxUB6X27qDQRFr/IopEPcz
	wTBdyFFOV4A3lvmuNOG3SgEq+LtHexOaLhofimaWJbK/HajDtYO2Bb8Q6tA8jO5YMqc0o5JrGUI
	RJodi65GDRce+2sctyK1E64bNJIdZeF90PKad8JKTV43m0UPIt0cb8DqU8s9nMjN1b6+Sw=
X-Received: by 2002:a17:903:40ca:b0:2a1:5d2:2e45 with SMTP id
 d9443c01a7336-2a870e7dbf0mr74134655ad.59.1769680426799; Thu, 29 Jan 2026
 01:53:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-3-shengjiu.wang@nxp.com> <36309f30-8b83-4eaa-842e-c663edd8a439@oss.nxp.com>
In-Reply-To: <36309f30-8b83-4eaa-842e-c663edd8a439@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 17:53:34 +0800
X-Gm-Features: AZwV_QhJaxBDlnFwwTXJVH6oDtpo891knd-s55tPdoqjkrrPNspPNZy-5Dfzq3s
Message-ID: <CAA+D8AP==mteo7ucx=R4eyPw+DpBUtzC7H1++_iZBMN1kkPJsA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 5:17=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 1/28/26 09:18, Shengjiu Wang wrote:
>
> Add a compatible string and clock mapping table to support ASRC on the
> i.MX952 platform.
>
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> So need to trigger asrc before dma on i.MX952, and add delay to wait
> output data is generated then start the EDMA for output, otherwise the
> m2m function has noise issues.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> This patch does more than one logical change.
>
> I would split in two patches:
>
> - 1) introduce functionality to start ASRC before DMA.
>
> - 2) add imx952 support including clk_map and introduce fsl_asrc_imx952_d=
ata

Ok, will separate them.

best regards
Shengjiu Wang
>
> Thanks,
>
> Daniel.
>
>
