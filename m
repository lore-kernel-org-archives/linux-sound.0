Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18352C326F
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 08:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761499; cv=pass; b=EHz4XXNyS3cHCbfFU0hn1hTXodzXlT25b4iWqO2lJOlDVloFjt4n5xaUf5ZoUSWkDOMQahsUt97hqOTA/l8SC/iwATJ3DYzGgrTvhD1Dn3ZUbYc0NN6pYRT4OeMfh9uQ3YRMBwkaAoihm8MKMM34jk4CHvGJJP5nlLeCaOyJE70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761499; c=relaxed/simple;
	bh=ZC+fuQk21hYzdagNdpY7ch+QY0LHmxNvBoMUa+2kaN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lO2xm4wLnoNHt6wIlKAFfwb1Fn3nDc+kK7jYPAXZiWXPVBqTY3eY1zIFog1A8gJKvh/JWzr5KrlF2MhD3+nA3u4h1ojWL6WaFvXZhaf0raWVM5vVrh7AJbjyMkWfvZQDoyUymoW4WBLWZy/FNE7HByz4Aq3ymmdFZzFUiOhADNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFnRJZcl; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFnRJZcl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34f2a0c4574so1612294a91.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 00:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769761496; cv=none;
        d=google.com; s=arc-20240605;
        b=A9OU0/HbU5PViXeEGV/KPoissskxkTKBMrusq0rhWDn0OsXevejaLn4vzDkaP9tIZb
         j9vlTn13ftQCwqv+EUYEX1iVLZjjWfJGB19ZDsz+ekaUyLuDMqAApA659y8B5g906tzc
         rTpzh+ccz3qxx/3h1rAiXhEDs7zN+Xj9KMQLum1+wkpo0UGmgCD3mBVdYwIC3F8mCD7a
         HhWBgkbyoKvPrrrsDfv1nRtejBPgwn1mVJQ4n3BdeB1ulDkWNaxi8kNWD6qV9o3q1ulj
         W2GZKr7Ju/vAIzJNFKTMv9qGLNBOIzanBXHxV6YBce7V7HUactn3LUsC5EzEVVDlVnQr
         ojBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qIF2oyc7jSMJyV9MJXutUw0TkKSVy7Ny/HYiVWp/mcQ=;
        fh=NStmZ7EsWO0/5XJVZNnFt810lDEesMcJLC4JGsvCV5o=;
        b=Y86Bgm2IhTQMX84C/AePSxfy8LnLauAiaTbmKn806p+UoRKLnptt70kQw4j2tjZN5s
         njgyyWvt2clN/FOBYQlarKXto9rpWHimjx7pRuU9dEFqKYEFmTuPFTRHMLxO0QfndOkP
         BNKxxnkmnj7ScQecWVsaL7Cv5p4NhcxMUgEFNItrRRbHCu0XzDlYVVADEdhmIAcj6ByL
         m3utytHgvMXquJ5LKqUxPc2MAO9q9dgxZJar/0PvxGaAo2/pQTqBG6tfB3aafltFVkVk
         CHrBdZR4JGIjWnJm2vVzG8EHD9wEQc1Vok7k8bkH2kVd6F7sc/4rFTzV4GXwWeDxvmqu
         +UHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761496; x=1770366296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIF2oyc7jSMJyV9MJXutUw0TkKSVy7Ny/HYiVWp/mcQ=;
        b=iFnRJZcl9EB71rWtSjWBc5Qev0Hdq9FQ+WRu98/SP2CrPU/58NF/oRmapY9NSLJW3D
         EBP4EF0zGZpxt+aRlWWsOX7BxdFV6ALPfjU7Quhr54Pv1phMG7TsRE798C67Qckb+iso
         54qFyqaJqcwVshT9FP29VORQgnjV/PYIPfqScZIe59GNKHgrz9+Se9hDv5OMIDpZIs+U
         xsUbmNDtbwDNBR/ckbIneEF9WL1FDiH5KamNdq/593m49EYBKjxMdYIka7WqVybX6M1y
         ubZVJYHA6KA8ga0lHK4PHNS+qC9VQ+Qe5XcrxXgjGsiEUuyGIaR+YXGGCrbzqs0OU+MQ
         8PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761496; x=1770366296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qIF2oyc7jSMJyV9MJXutUw0TkKSVy7Ny/HYiVWp/mcQ=;
        b=tz+AB0C5mX4agzHmiE4WawgXb1hblJcLRTL0jpwmGbqthCdhsIHjJvT5EAaNFPahUw
         bk5NJ/8nxeOlmbKU3GAxbJSrbArQbDsGyTys69gaq0mUJ4DK7Xm8GoRA/ObzjEeqts0N
         g1uQN3bf5DsE1QaBPsFCnOrVfnX31Gfwl9KzbjlNWVzys1l24pB+bFgUkbx+7DFV+TPJ
         43ahLWGnxMVAosYVCLeu+Lurt5xnznBN7qtUyfHQyRy+6LCcALn+pILxj8nnzNUuUtaR
         4PUysjcy6XeV5o4hV/8pESqgGXURA/vWiFNB5qceDCC1TBbhlusnsP+b0jnIjm/uxWK1
         UM6w==
X-Forwarded-Encrypted: i=1; AJvYcCXOpzsBNAWQu6Q9jAnb7Yl0ga6qakYJO68w9v4vSar7odhapePyProxs16KUxgRthRLSRzTZ4vG/uO2mA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9meKovUkBSBZb4hRjXRc1+S+Um67sRhUKUQCxot58umVcuLKt
	6cHazMKGVcDEbjcIBZHYWfwSbPqzpK+YNUMxDi4NYdypU/w7X8WoDfPz8/fe18mS2UEVInWk9q8
	TGz3XyPQDbvb9jbBW25sHyu6cQPlQYeM=
X-Gm-Gg: AZuq6aLr70bMNcQQKc9tx/yRRgHg2oV2n4lCeYjpjYnVP7jylranAg+45rLrbH/sPdo
	4n2HJXD7AeEOrfVcntHeMVFkbRYEZz9PEehB2i4DT8zAxr3CThBHh9S15Ab3p+YDLSTt1Jyaumu
	QGV+Ymt1YPmT+DB8dBhkystaOg0CMnq3SJKI1wO9T/Rg9yF9Yt/BWz77T47YVppq7e/1DsZ0bYY
	2WvOKBJzvySI0wykZ7XfmgXh7/t5K4SnqJ/lGd7tp5b0SDL0q5fbtacMZ8trF5oB4PJZsU=
X-Received: by 2002:a17:90b:35cf:b0:353:e91:9b2f with SMTP id
 98e67ed59e1d1-3543b3c648emr2292966a91.37.1769761496076; Fri, 30 Jan 2026
 00:24:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com>
 <20260130054330.3462544-3-shengjiu.wang@nxp.com> <CAEnQRZC_6xRRi6y2t0MGe8udTPYWg9XEBFrxhFCbKYBCCD=OeA@mail.gmail.com>
In-Reply-To: <CAEnQRZC_6xRRi6y2t0MGe8udTPYWg9XEBFrxhFCbKYBCCD=OeA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 16:24:42 +0800
X-Gm-Features: AZwV_Qh3nyHcIbEYDDCvGcF70iBOk8SCVrc7tCSz-T6YiK9YuuynA5ywxyM9ma4
Message-ID: <CAA+D8AMkaTkHL03fi8THxK-a8xBR1Cu4BcNC5XfeZvzvwJ=rTw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 3:27=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.=
com> wrote:
> >
> > Add a compatible string and clock mapping table to support ASRC on the
> > i.MX952 platform.
> >
> > The clock mapping table is to map the clock sources on i.MX952 to the
> > clock ids in the driver, the clock ids are for all the clock sources on
> > all supported platforms.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> At this point imx952 has the issue with dma request not cleared you fix
> in patch 3/4.
>
> So in order to avoid this you need to swap patches 2 and 3.  And in the
> newly patch 3 you will fill fsl_asrc_imx952_data with correct value
> for start_before_dma.
>
> Thus we also keep everything working for bisection.

Good catch. I will swap them.

best regards
Shengjiu Wang
