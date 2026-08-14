Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BDD3F7AB2
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693288; cv=pass; b=du7vudsfMyPWXq6l7L2jsEa+rqszGkvkWY4E4D5/qJfgCHCCqt8ege8Sn6kyVEp/Lo46eUqW6AmIH7HvMCqitDum9HiMJYej97ZkoHGRQxImjkxuTBJqDBbF5DGYWhp1U2oOBAoOC994wpQlauxtgzY3P6uU6SfG/r91GRQa7IQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693288; c=relaxed/simple;
	bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SmBCSkwZZp/9oAGshjRMOzy5nSiyovesCxsiutB+ZB3U4IszjXSn2JMhFgQ9/sRNmdTF2Ex5Yw1nQrdAUHjXv1IrJT5weLNVs8rzBUhjOOYPHY9tEtTSYgblsLM9/cKXo3mKkYgYZkHlIhocnRgQqIcFo4E+ZtHrKKVhMBy3Jhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EazMxGCy; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EazMxGCy"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38511175ad3so682178a91.2
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 00:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786693277; cv=none;
        d=google.com; s=arc-20260327;
        b=Z61ororCQLsvNrZK8LdNWPoDHEc4lZs6mVecI+RMyLaXpFdg88dlz7cJLPSsuWXj4q
         123sP6ysCboLLjeqHppP4raSFr157Z1514YcvzvrDoDKiTgOoOjpv68sJx0L+SBVC2hb
         rRB+H77lIPS2nqCHdko+LOwqYviVNYWC2zOIZYioPvpGge+JGCD4mvt9K++ks09dHrq0
         C79BtpCIivAqb0XLaxiDF7Sq3lr0gPrhc5jg22M0yW8bM5kQZa5biGg+XASqhDu7zrgr
         D418//Bhz1m6CCb7jbznKaGO9KOd5JiH4cJ/K3VkqV1e3ORkY57nnf2nPczLiYDpPhKa
         kD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        fh=LSQlTQPTCg3Ip3CjqwWp0UATAOv44KzrLk81D8XM4es=;
        b=A6vXilSyIL+S2jjCqjZDISkw8EqCO+A8CPldW/vHuCJI+ABYYq0ygUg6QZLDyI+zu0
         05qcPmmSO5Q6KsqIHVO+DHMi+iU6RVr8/9zU3BcnQt/3xmeh0NUcGNypEg5XybiyZkZG
         792SgS5Mv7KaCuMuG428ahkCnx7L6dPNjgfvK/kxV7m9QR+orNk7IWJRqn2Cd7prvZ+w
         OkP+7/2JZQWVGte3WbVc639tw6Y5HsBIzXSe/BWYQLec09obVmDno2jbEWEjoxbSDiAk
         HUZzw3TYOmLyEn5rdz9ADU4ADG5ahayzSwiYd8C10+tUpKl9ofzcDtkg8HcK3mgpt8GS
         rDiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693277; x=1787298077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        b=EazMxGCyQltK6qCWpEez4e1UxuXswYnZNKpc2CkSRvCO3b/N0NwRHfD+glg4GjVDT/
         Mn9gvA2cX3BbVv4hGWsM6jCkjsiygXWJB0kpJzDY9558jsmR/bm6j8paSxkBcNmkW5dJ
         z8pcXszFYGNVq6IUIj8LbrrttjKzx9ld9WauPYuaFjSzfKVgLj2pkuP+BKIBkLH8OOHP
         Y9WECnH/vdmtvrdk71jVy+YTh41tNc/qO5QIKfkiIqj1jGv5hJ8ao5gSDrNvrT9bVCwF
         oIvk7JU2evyZFftqRakBffBz7cH/TmeunOQ7u5TBeflt25if4Ux5C51OxZNxrIHrTcsd
         EwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693277; x=1787298077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        b=S9Fz4ApzSIj+hGxfW5r9s11c9USiGkwnchifXZnQ7OWKnhv3xxBnXnf4yuB9mWC6g2
         Ggzb3mKC8/7kYWX8pOBbziiOVSfTAmJlAxdKwk5z6t2M4sZ8Lz4Y9qLUHOvemk7fuBeT
         Kl8/+HWvPeex1AIzfykyqIUsGvA7qMiN2gvXE0x9tr6nX2aukkdZT1RuyZC8IEWQKkZM
         bm33iCCAaS1w/OEMblWVHd3mNBOvy/LWOADqRWzKIJsPPjHqN1TxSnbiiUtAA+q4ODmO
         tn/7EcKFpJAZMTBIPe11EwvzDSXsSms3yHAcTAMyo8lRkRP6Sij79FMXaXilnowVDbc6
         U0Kw==
X-Forwarded-Encrypted: i=1; AHgh+RrP8Xa8Rc98g0vnCM+2wHqkzAev1AExJmPESeTA6VqEnUURoGpXCDVvufgjZJKqBCWCNZwaPh5yMMBQvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzABITsG5ETg6tfsGCEM9tKepqROlP/gM1ePq35ECYF2vGvhEqz
	Jjwsrr/B24QgurKUpoIJK/xBsTFmgNfDkP9jadouT7LrdoVIi51MynskrEY6ihHgqAFxesZexCf
	GrPShRB/ZaOWlDRXAj2ghCgzWAn4FMCs=
X-Gm-Gg: AR+sD121KBD8lKcNWERZZZHneSYwOskB8PeRE+xc/xZ+ZBV83y5kWTDENazf9udlVuI
	RrWMIRiE5Q6+QnQpp8Y2EkhgFF1A5GiFcsaq8nt0vubm4pxikcmnZSrXD/N7uEUGW/0N0/7t+BL
	mrKs6ZB6YhFSEbRu465DgmXtOdkr8Tp6Uvqc+9QGKFAHG6L4IYYorHQHW/lUcZjgczx1DAW0jH0
	aE7LXJPNX6T53g6pwW0HuK1jRYq6q3v5OAWSIF0sBFD0iW+ZfJSKu0ASAiwAcLKe4aIVIaDfDou
	53q097Jz4bSjhgLZJpJ1sMCLrcQ9s3xy/jb023Q/ANX+Ug==
X-Received: by 2002:a17:90b:3d8b:b0:38e:1497:af5b with SMTP id
 98e67ed59e1d1-3933b77ece8mr4578497a91.1.1786693276690; Fri, 14 Aug 2026
 00:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com> <20260814-lean-classy-hyrax-60aab2@quoll>
In-Reply-To: <20260814-lean-classy-hyrax-60aab2@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 14 Aug 2026 15:41:01 +0800
X-Gm-Features: AUfX_mxVp0mCUmIh3cD49Kgp4iw4sN-NjfTifnUiJEeotRXNzWAYJPCWyxB1G3Y
Message-ID: <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
>
> Each one or only the newest? You will be getting the same questions.

Each one.

Best regards
Shengjiu Wang

>
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
>
> Best regards,
> Krzysztof
>
