Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09B0309EF9
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 07:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769757616; cv=pass; b=MGfnG0fNmQILOzJN+v/ZKq67zl2+T5iPz73QJpTLS8JImNPuUS1t5iHbRPzm5EfVt0e9FrG79nq23tW3zxxx2uut9lozimovgPpGqNCex2U+L1MFpIcAFy9JEgZ2JST/W0X6pp2uizAOi5Cdu6OEPX3MPLL8GrmvNohCJ0vQ4eA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769757616; c=relaxed/simple;
	bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTu8GBGMORycflW3lnRbD914kPMwHvjPY9vTCMwPFMWSM4VqVjO++jlAPQbHA80PTLe++aADct3Zo4Nqog5e0fvBvJbqa57WhVGCC4cyHGbPWydgYlZc/IZRjlChKyILA0F0q7dYFR2ODIP5Y3iIayaFs7aB6PW4yh4l3hG1Djk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/ILPWEx; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/ILPWEx"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-124afd03fd1so2789267c88.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Jan 2026 23:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769757614; cv=none;
        d=google.com; s=arc-20240605;
        b=NjdXD0WtA3yLoy9xzpNwA1BjwROST+3PiUPXtjV4Gw4CGpsR/sheMA0wp7sRFI23rX
         w7paKX/why3vORgIKQDULjZp7vfMqoMBMXjMEytVp34vaHuiLqAjij29JIRUZ3TQpo61
         V/7SARldDvfKPVPxJKYnJ4GnuBcyK4rQx/A8uX1PLvWTtP4f3gThMpFcrXn9YxK6dy1T
         k4wzLn2Kl4iKyRVzomUzBWq9YYuTHU0Ik8M2It4S+NPInSR2KnVhZYdGQd35xQrfG3LJ
         zufzHvNjH4GEKeXXa83WpDUuKUDkrZEyVHaeDVbpRafpUfmj7rSik1iOa3pDFBzyR5Ji
         5Bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        fh=KrxXrrKwqvMxyLk1B+hcjpwoHoDZU/O3Pgj2L4IJc04=;
        b=O+/Mbx4USvhTApLZ7VYUPgXyGwssgr+pLCswfQOUswzc85bp/UR1f1RXMtOdbgzwL8
         NGHMYLETp1SECC1Kcmt6RpoismTXmC6LuKcu9F7eo2I13XXrrnyMmh9FVLgCAXawNIfM
         JMt/FzFcz3908wTyB18nY+YuT1g1yg01Ng3/17T1vuJ4RKDVSGdNS8/jgj+NNMWA4aQK
         W2SVt9K8k6MZEd/lsZqTvDg1cYRSK0Q+diDm2n2zJUn8w8ZjCqmbSf1JJri+uZDxjU+E
         J0zhjAMBqkPIoT9yY+kdyUbz6vIftgReoUF+VSbhANiIQXaXa0R+sKwWWJUirJ9dbBXi
         LsUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769757614; x=1770362414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        b=j/ILPWExDCSQ/1WKGvUTA9iQzXyFaibJIRP1S2yZ9gj3THGJp3IwVMNgYrOpXyIJZA
         5Q8riQEbliX10DFS+F5sLSkoGNoRlNhds0AX/tnJQ9Kc64kKqZZnYClXLhf6VCZh/7Cr
         yhHubY95wfsQpOglJV8IIXUPPpnInGYRe+CGpLeKQ/Yj66SJE1KQwV41gwdfTVAjO3+C
         89o0h7/wqpMohEywXTTubLZogYKAp/ER1YeSjGST0U0Ui8Lq9pgvBmOiM6YhNFQiYu4B
         JKR7XhUizIHWWEOu/+DN4sSqhBb9QzSRP+D0CedtZrUl2MZvK9SYHN2DyqNu8UyjrlRJ
         AurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757614; x=1770362414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        b=QuvVHQ4hNv3FJi+B0FFb3+nIYa2QK1BDleOt6x/Uo+lo6T0ayElQ0BY/ueokMBwjBl
         FTKIOlGvd14fMaGuqWt2ZdEiImOfKSSrr0vKA2BkTvfAimzep39mLxW5jBUN43iFcWna
         XDrsCkMGVUydZ5xSsriwOXugoQ2+dJpx0yDndZq3+NntqZMmlkp9MLBcp2jbOmplLtmV
         pHDlwKV2bUpiZTXSBKDozPEL8zKAy2kkxWjgU1AX13fASaUt8SJ+BhXLV8aAm3+dMlgO
         H+TP/3dO6usRQVO8IZAwk06O3+L3SBvH/Llx5Qr4xJd1Sn0NHlFYIYUOxQGo+qLOs6KB
         JkUg==
X-Forwarded-Encrypted: i=1; AJvYcCX7rTa32e++7zrqqsv0R856P4J757zNh79I19EEdRBIDOCF5nYVksAny8Qy+FNr4E9QHEiQCkLtm6VLOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwNd+S7FRyO/M8X5uUCR830epyA1Vw5tE3xT2Y03tGPBRTRt/W
	6l3s4PPbSmc1rwdHgxuqLhgiZ5f0ObOAlR9ENqW4L+k32mZjA9ZuDU/z0X9TjoERWQZpJO3iaXy
	lazh7/EMPbd7+1ylmU9fpNzhP8BFUDAs=
X-Gm-Gg: AZuq6aKLgXzfSM4pJMeAetqyhJUGwHHxkqAwkRiB8wabv1JCm8wCmbCzZx7DJdyhEsR
	4qVhLHipZzLkRTbhuKKf5Yksw0xl9pfxoMkLb39RLgiooFt0Xay5KW/uTDZSFEVFKaiZEbMUKdW
	VjocR5njanZ0cAgSUzVp6s0dg1JpTXnch7lwOhsztYwGIAMs0Ne4VB9OEIYzcMiJ7985criSjs7
	/hwJM5Z1+u6VgH4fMv87PKnfrxjbEzie3oCog3F2fVdDC3owfNn7cMvR7eObFWiv1vWOg52p8XH
	m770eRhY68vnEZ1zYknng8uziNzCpVQpVaiJptQq6tneT8JAi5FQu9xkqn7wqXlUzAIK0HKwLPS
	Yk67UHbqLDJMR7g==
X-Received: by 2002:a05:7022:207:b0:123:35a4:e8be with SMTP id
 a92af1059eb24-125c0f8d01fmr955848c88.13.1769757613717; Thu, 29 Jan 2026
 23:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com> <20260130054330.3462544-2-shengjiu.wang@nxp.com>
In-Reply-To: <20260130054330.3462544-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 30 Jan 2026 09:20:01 +0200
X-Gm-Features: AZwV_QhrTfQ-UYZ4PfDVoCm6fliDdKe2PvVXhTLbJKtRrXqH5MmZHe0lNlu_Efo
Message-ID: <CAEnQRZC5umZYoxemGO_yc5xT328uQxUG8Sg8yZvgDowhLP6UPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
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

On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform,
> below are the differences that make this ASRC not fallback compatible
> with other platforms.
>
> 1) There is a power domain on i.MX952 for the wakeupmix system where
> ASRC is in. But it is enabled by default, ASRC device don't need
> to enable it, so it is optional for i.MX952.
> 2) The clock sources of ASRC are different on i.MX952.
> 3) There is a limitation on i.MX952 that DMA request is not cleared at th=
e
> end of conversion with dma slave mode. Which causes sample is dropped fro=
m
> the input fifo on the second time if DMA is triggered before the client
> device and DMA may copy wrong data from output fifo as the output fifo is
> not ready in the beginning. So there is specially handling in the driver.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
