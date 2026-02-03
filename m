Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1982F2C026C
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 08:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107570; cv=pass; b=RfJJ6wTpt0dcvYybLN923qT/84tLeTeGLU4waDX2RZD8J6F2+1dlAZySk7/cPJ558teUqxH6DPT5+4gKBuOpAMkrgHyU3QNWuwJasy4MHX4nz59IkJoOWUEUPzh9Ro++FzqtP/BsoW3+KH3ISiwZecd4/TmWnKkWi71zycIZDAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107570; c=relaxed/simple;
	bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oWuxQ3sT2+FJgbWn3cXTfQ7T5paXSaA3CZkiJciGLAlnAoK6dui4GLusvKrigE8JP3UZnvN8mbtZLhNZ+uxHBitj56j+C2Zpas4t1+DzR28MV4s7biT/OAIH3kjtcDaHzXMLk0NBOT8N17yfrT1q+ogTkYTlxLZhzx3EiPfODRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAS8aLVz; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAS8aLVz"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1249b9f5703so7098406c88.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Feb 2026 00:32:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770107566; cv=none;
        d=google.com; s=arc-20240605;
        b=R30OeabzLeORPeNONyTvHr+mwU4G3gTm0y1sjJMmHMmTIiYGy4p9e76ybwcaOs1GjS
         PJmghwpFMDxPdeWtS8OAM6c3ER5VTNVLdmbJXV7LOPKKPN3RIx4Svnyhx4ujk+IF2LQ+
         U+rUK1FikjUVLhtpl20dK42mm23y10aVRmE4C0i3K1Kum8TUadBowXPc/K0DV9m6gzHB
         N58C4jHaNN4H/Qh81ZwxS6tovNOfbS9vzAd6f18pJSCDgkFf6IUjDNwyG2S+3/VHRZfT
         CNd+CN9L0L4g4NSTXdrAV0tbhdcyVxlDoO5+MJ+ij/5rIjV1jec0wRJvubLDbT0v3Spg
         KgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
        fh=ZjVR7J8RhkgIEX1svKRlt5lNn4QtsQfi8aVijio0N3E=;
        b=K+BviVioxMsJYNnAM1feZJCOyc5ehMQ7xgUmstDESWBkVFGNVAYhhNveM67qORnqtv
         5fqoi8E2ylW30ugf1E9hFAyPWG/CXPn51N0E0mjPjwtOphsApmM1BmhvW6L+87x0ouQd
         hs+knBxJKBfz9JFIbcxvoAYRMl7eXkeHJN3Z0m7kit8/HaA+4AhyXwpCenqTKiHsvChO
         oKT5krRZ78RiEcuq4rHo2KFsJ3450ZYg9ztfJJTuqC1fm66PefWmXpP60y25/6VnClUx
         IxXzwuAaZIUdzqmiFwKt+lM2pYOnzPGQtSX2y2NEA/nzKxSy4xGJmiI/MoY9KAW0PB0x
         sfhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770107566; x=1770712366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
        b=QAS8aLVzVm3AUOdwB2ARjevFqRe5gxYz3z5yblgPSZm7OdDUuEzfHzPYxYr8WAYzXW
         t1/kPsv8ntpg/qoEVRZ2lsoq9G8G0453yy6qMOdLZ7dE/izQ3+AG8jGvCYFSmJIHUt2b
         KB7cNe7Qzzb54a2PfI8n1zfFJbVX5jz24AKjyxI0Sm74LbJPX9ebnSAK31G17JmstJXv
         HUMPW30P8zAySB/VRwbT0qUHVz9S1yHnheeijOYp39RZ15EivDNH9xZZM78vTkXXWrBw
         +mPr1MM6qwx8UnQq9x7/eaz+Tdbgu5fsAxFdT3X/9id5gALh92KDIxstq5gR9i5eQlUZ
         KOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770107566; x=1770712366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ry0FHVTHq/pJe0PrqW5meMtNFTvAS6/0OqoEfkOx9WI=;
        b=fg9TznARwAfmkeuCcTEIM09PMhR6tVEwyieKr6FnxTorz1054Wb0BYyzc6UJiZdSRb
         sA0wmJFNW3LxS4WAG2EuRFDIqlWrr51IA9feWLfBoKIPvrLmyOK2Un4jXzRcw/FzVbNR
         FLIbgXLXZdyOsnqq7G8A2FcCiicO1gAST/RD3zZZGfTMwylc/Vp19veVC2a9tcXMAWpg
         NyzJkzAXWFyZcalVQ4tEZKxWWT6eNsEJe4yXrQCEfouqvMAhNSMPLG26y3xc+vWjB27p
         c/oRAgDUe/jNMTNFx4D+ZWop1HEYcJ7BcO8iksqngxh2fOnK0MyTL8fUJdq18vXGs989
         n96A==
X-Forwarded-Encrypted: i=1; AJvYcCX4D2jwaI3e/uAtWoFLXV81yftZl50aibnixA43tONZ8EkstwMAM2lGmsDMhOOopxqC4GOCAfmQpei12g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcnI8oQNtE58o8OefcxGTWA5wz2ZVSGi5GwV3T3qWDgeCAvmlq
	iMGiKausWNZllBVn0LwFdwnVlWKJ6Jr3+kENsIH8vBe5vhhU/3E3ceCASb/MX7eAUmGg7/HNQ36
	87RzGAouh63VhV+6hoaKDmTLwXac76qo=
X-Gm-Gg: AZuq6aLprZLK1JKd4+6ljBzvf1WO2j9Dg4cnM86BHTwKrI7rS0UPFUDCux/Ter2p+dh
	yx9fuUFYLsTcccbngYyC+GZM/b8rLF37dwSTfv5fH6iLC+gPmI116LW35uKn7/EFrmO5ma6acD/
	nywIX6hmrenQ+x+0TR56krs5rIyEYA46+eNNZ4ln1NwU5Zjby7QfTlLGST5+XA+Hf05vpT7ccun
	KVMjTEGLbdRwkKEdWQJtXwRT/6IspiqDO95VkUj/Hjr1PfDVQHl2eY3CJaejJJ2ehzRJG8+R63o
	Qtp43FYkNUKsNezHOUtdNYdT3YFUCzL/bMxl1B6egqr+d/jlkrcgfXZsN79CJYK2L6z6wU2i5xf
	HTNVqaMlmTQ==
X-Received: by 2002:a05:7022:160b:b0:119:e569:f60d with SMTP id
 a92af1059eb24-125c0f8c302mr7264388c88.6.1770107566507; Tue, 03 Feb 2026
 00:32:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com> <20260203031345.3850533-3-shengjiu.wang@nxp.com>
In-Reply-To: <20260203031345.3850533-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 10:35:27 +0200
X-Gm-Features: AZwV_Qgw24M2z0kseZy1hei1NjvsOXkgK0vaXVyKxBbNrRS-X0jSjdoVh3qv9-s
Message-ID: <CAEnQRZAgjyKYZEJ9FVqRsCfzLOqwbRZXahqMMNdJpP54NAQ1PQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC
 before DMA device for M2M
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 5:13=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> There is a limitation on i.MX952 that dma request is not cleared at the
> end of conversion with dma slave mode. Which causes sample is dropped
> from the input fifo on the second time if dma is triggered before the
> client device and EDMA may copy wrong data from output fifo as the output
> fifo is not ready in the beginning.
>
> The solution is to trigger asrc before dma on i.MX952, and add delay to
> wait output data is generated then start the EDMA for output, otherwise
> the m2m function has noise issues.
>
> So add an option to start ASRC first for M2M before ASRC is enabled on
> i.MX952.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
