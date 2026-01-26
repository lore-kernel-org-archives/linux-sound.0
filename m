Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D96341041
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442909; cv=pass; b=eTJ+dIHUifwp3XJouKvoDXron5cZUdQ1F+ye2rV9sDbNFPZkqGK688r35sbHF/9JWYl24UVgadS8GQoxUCzPk+DuZYAtEhdEr2u9ecpivpCuHEaxJ5UyUY1rSfG079zp+Mi2TWE+vVf9pS8Nt9GwVM4UH+Vpqg2W4fptRqp/be0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442909; c=relaxed/simple;
	bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atV+JVx2apzoaMUORgY6uacbjmQhk3vOMmC5dbFiEXz/JJdXlC1CfqcV3CB/weeIBVmSOSJKXEw6AB7xbBmYAVtqBM9f998sc3Vv23ia/h9uGvtds0NJXyYOCbUjV9Og8Rc8gZvcT0AVDjSjIXJKy4wAwpSG6a0rfEQLGt0issA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIQhsNZg; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIQhsNZg"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1249b9f5703so281078c88.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 07:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769442907; cv=none;
        d=google.com; s=arc-20240605;
        b=SxMnlPHQeoVFalY+q3znibHUaWKIeWuW5ID1uovonXaIqMV98EbzgUIVeRpPt33RHv
         A8tr9qkQ497LAPb6T26JtYzDozS8T2B9YIITDR7yfIqNJi3SGuTNiiYv1pD8O/WWBvkU
         jjFGHkNqSb//cYYcav59LUpwT3RoSBdoXOSdfaqFIKJ49fic1GYN+X6HjsZOYnqipx9B
         aYA2hQXs6cFx9bnkh+yGIg0u4ac6claUruq2A9NgHiM9eNQ1225CakZG4q4JNgIpkv0M
         WhPbKNvUu+Gel5d8EooFPGx6iKS8mjnbUTRMAfA5isqiauNVL+ZPtuzV3ahmEYudQ5Ns
         2ncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
        fh=6xvwAF+mgFiLDAxIuw1naNMbv4xapQhZvaJsAMpr7a0=;
        b=LqFDtvKmBJ5FiGOBVj0ww9S0OIk2nZp5PcoCSFLbHLD5RBFBEmNfPstHoiqCoKyyt0
         Y+dfIiF5WR05sctfpteDlu7KeEqqsj8ndFzmPwUhXcUmDXkYtE1y3I212HiFjHvEHE1j
         mO3+3/uTTCO+08VrczplcYd1/FU2U25JuPfPnYiN6x1To3qSecYiTs2W616KnYwzI1vk
         7+FC550vnUnUj96ickHSIBtLoyI1kCopmJDpErow3w/QCL0K8mC6/UAalxVKwgom3pXY
         ckc8U+rrobG6dx7FMbJn3q8o9tiv4zHxrFcn9kapunpWN29suprPQchbU/3C+9Eqq7AL
         wzjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769442907; x=1770047707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
        b=YIQhsNZgKYUrfy8ThLi1XDgSXD/sPVR9CKYFP48OjMu+uZ2+3jibeFPD6kCVytkbRi
         naeLa0MCbTv87hQaiyGduFnz0NJQZNTMAg14+/9cdEDB3QYDlTcqLt7fcQZ7dGIuGhv7
         ad5rIae0G0nda8B/s2uiH5BOcOPCZCwnlLRT1WCBLRD5Q01FQ9oluIy1caLqUMNQX6g8
         AQLGJc5kEkgMJKP9lEkBCE6D052AzjCqgnJloa4NWqZRRei5WMsg2Jy3Js/oTvgkUwSs
         PC2pAwBgKb/KbEO8bvB1x/k24WD72aiTVxygsyOZwaJf0E1+fBrzsgtIs4rJh5JNnPKI
         l9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442907; x=1770047707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
        b=s+UqVqu3ukr2T7W8O+HobeES7RR+fxItuCmFJ3BF76al+SmFmxlMYeY22YJSna5J/k
         d+7YRHx4B8i1+TZRr/oP5qLRpO8q0oIZC1izFctA/yzlI786yLEfVElj1v/Y+8ihadNP
         KWGAHQ1GRtfgv+mWUb/0sKhIjaFzIYDI7GCQ7UIp23l+SSxz8Dm8MEl/izf+7vhFmQoa
         7Hd2xfeSIcvOmqjfZSCuf0UC39suhM7rguWSMALrUHrXLs5omMG/n1ORYxI6XI2XBxQL
         2cDDMIB/dpbaXtUCyTyX4NkNeoRPGvOJsjQFrTArMldRuS6HWV2DSFO3pMmOKp3MicNH
         B10w==
X-Forwarded-Encrypted: i=1; AJvYcCUZLqNS8zKyCQmvcLML1O1bOlP6htPREmgE8oQyFWAJbwGcsApeLi5M3yAFpad0ih3gi0M4cc4Pm0MHbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrNyPE/NTwwgVzZgyiqCFZneCDh8lI93BW8wlUNmzs5+c47aiK
	dcJvQB0BznqUNlQQIu1OPt+HXtnGL1MeUpG+fhbz69dPeA8DWkuCW9SZ1vY81XMn+OWNBeZmF7h
	h2GpOnCApMFsy1Oo/roFfe9afqdbSIgI=
X-Gm-Gg: AZuq6aJ0GToJqFIeyINVHjn8/zKb23+dIs7Z6PPLLwsrGNLzmbk3XrZVG0/4/oaBHuE
	1YEhDeESlojHdfAtzujlOuQ7Fh5tRjsN7wKx16ymWZo8WoIH8dZmvDGcVs9igJJtAUNmaUgA2UZ
	pZzT1+RfmHrOQscisIywT/ebpcFfeezMOVH1vTS6cfuy2ePvsYf3cUUMGu1Klw9GQcoE1GKAM1g
	0oBz7YbSNkVRV8fCoAhLK7VqEpWjJ3emVUQUkAZOGYx9Rvee8alHQrjQ0PiN9Yet3Fr0dmw5Cje
	uKa3ai5AQqxvgFmlpAoaedG4nkxA50LlRXNiFownATqtLugUeqdwIXLLmbLkN2rGxuNl42tN0wt
	cTvmu4zcATQP9tw==
X-Received: by 2002:a05:7022:6083:b0:119:e569:f610 with SMTP id
 a92af1059eb24-1248ebf0a49mr1954211c88.9.1769442907480; Mon, 26 Jan 2026
 07:55:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com> <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 Jan 2026 17:57:52 +0200
X-Gm-Features: AZwV_QhA7W5Q3bPcFDKVTkQAu_DrVk_1nocQQ4dhm96_V9DFsolG5j1PxG9BQFE
Message-ID: <CAEnQRZAsiciJDQTAOjwQRZqxMW7sNifRf5rGBNq_sS0s0kJKcQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Chancel Liu <chancel.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 4:57=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add support for AONMIX MQS (i.e. MQS1).
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
