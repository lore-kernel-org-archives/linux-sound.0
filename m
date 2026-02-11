Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232ED36BCCB
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 11:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808583; cv=pass; b=Q7+P6sfmN6woISWF8ZWVTz7LxYlehziDIZF0Qwx0qBVihl+Vvg1XvAm5AYCKEheA84TUFw5qFDfn6mSmxTNPlyaZ5+InlQYSel8MBAH3rJTbNNNp1Tais+lsLYUJsoWQEI4Jyoszy/BydFwotBraoq8DNzHhZHUFOgmdip0R3n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808583; c=relaxed/simple;
	bh=TQtFWDUFC9Q+h9eakxOpRHAmmpm/Bi7YwUotB1e9/dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGHKDuaTFxaupZWcH15OwGMPUI1/Y9YXFF4D3Roj47NBZmwhjz+8BoHsHsEb8HFHRTrSxWUqkvgHGBkEPk1QJ2gmf0T6a5EILbq+amlFK/SdUkcRu4ADIrvBw6pDzSYZmk6Dx2RVP2OpAw61y2PbuNEqEKGAgW4XGigMvohSTNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfXGL1hd; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfXGL1hd"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bde0f62464cso2040717a12.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 03:16:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770808581; cv=none;
        d=google.com; s=arc-20240605;
        b=Vv7Xnbf27NIpH/EhL0uDsiMa278Nb/so8jH1WELCj8QDxIcOKN2P2ATvB3sLUgWoh2
         SoVeXcC3UVuvCPyGlqht2Wz2/6jBJvcbFPPSLiYBfCdyNOqZrJ+m06xWN5Ngo/4w2he1
         7kmD1F+ULvfDXLQNeN8KjH4c/QMN1ylIoEP/uJeyPJBE/qPnDjfNU4I3hoxEXUl3JNfR
         XSuabIn19qnmOnpjEpYVV6TaDT0OyeVRIiJDoYo8HZWcX4ChQWhqXnXvO/hJUzIDYpUW
         dMemmUX/Miq+ze2mQhlPcxQ2Wlvw661nDLJSvdVqy0okL9dV+xqIO47kfogCmu0xdWS8
         1xOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITSmsKKlErBQAfGAY+FolV5NlpcuQ4Y5Vyb6mMkMFY8=;
        fh=L00EiF55cV3acnkUuWPSozugQA2QG8VwqX7beZPrLuU=;
        b=e/x0qNWg8tSwefF+EyeVmHrFKKVVYBodpygzBjUvrxImDTpkxdzoP5Koc/0Bnpfquw
         dfc7xiAcwOj6J7q9K29JLqwK4J5Xc8Fwk/ctHO1S0o1ij9S8qjjBLHtngpk0RsrvKgjJ
         ocGjHGKfxmYzshHfIq6RiGJ5LNY5Y7FpWlIu9Rkdf0TDjXjI+Si7OKwXudNYdd6BNrRk
         mlKGgOw02KuCm0P1yF9mUBtjOEAF97ydqnE80reF+FNLp/xwHC05KuQqFHIPBcq6aNhc
         Y1o+TzQ2oCtDZsKsb1ZedghPhYtz6IFAbbuZ19tJkHdEvx6u4qg4ND6wtQZlJ2l7rYfp
         cwCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770808581; x=1771413381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITSmsKKlErBQAfGAY+FolV5NlpcuQ4Y5Vyb6mMkMFY8=;
        b=CfXGL1hde1RT1PdcaOAD2qbOJGhODWqvNC3FoLQR8FOqA1Pc9cN99U0pwBj2dyDb44
         E2IiJvew22QsVSpNBccE3+tfG+vlOeHJ8gUCCmxWMIK4GyUeC+qNbgctjZQKvBilFmcc
         +H7SdJOkwPGujODeDDMe7u4l5mgCC5ywbenw7HQoLf9NcVqkLFSO4OMzuMqaD4hYz74l
         dB1p6JNlxzOrcdlPBqGyfQSndpd5BTXkCvH7nGsTolIHXBOK2s/wVeP/HwQv5ATt7U/m
         DQ12Lggd5RN7gUE6OVsWj6OpXPPHo3fRa4z1uahn1b6VB2VHsUEocvsDsWFlz8AWu7Kk
         4vFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770808581; x=1771413381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ITSmsKKlErBQAfGAY+FolV5NlpcuQ4Y5Vyb6mMkMFY8=;
        b=gDdDSpvcxNg5fb//eRu7EM6RjxS4Lw3YqhqEk7Q5L4/GPozfaIQedar7AzWG+kvBv2
         2nYYwFRg+7VHHRhhkdurTp+tVy+lbTrKyz0BR/sOf9UfaMA93XzjRBwPIqdZwniSSO4u
         6rkJCqow0sPA304gZcbM8U/Kp2xRoTEdPKrNI2KaZfpOJc1MtyoMO2BL7+x9gtikTc/e
         rLGbYr+lHTWmsemYBJRxqcuPScE1ueUSjjVdl4pCf7PgEo8YAJujN/EDSpIJahjqwn95
         W5GxaGui5jWNywZ55wVB08JsPnx3PsIudtDr6Vo+oHQbISQ/Q/Xlc/0H9UR6GPlnXq3c
         ikWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgkSvth6o+CWBoMZOhA51QK4RdXVUN5lLbNtQGUc6x1sBySS1IOc6paHypjLi2nXDSHN1HubzF42QyTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+awod3d4Xy99/QfWNIXdAoPfpeTPizhN5kmBC/GwQ2ezrCMr
	VEv0CSMDGmO6lp3D9Fs+fgyfhWtsb1ao5e2KZRthaiLet2ipYGEvK5s0I15tznzNbQrVrCpHFaq
	slBbPqcoKp4Pj1FWRzUUJc5FToIiZ3Eg=
X-Gm-Gg: AZuq6aJTxymCIz28KlVHIs3eMN+XW22SJFpuNhzQhws5PWlkFdf59MdNFR8t4MOxwgD
	5pILvkGUK8oCxqV0KluqWitmaBwUgkvExVEe5TW7NYcVfCwQdjRJU9CKxhQr6nqczNaFB6+hlXv
	/VzKn6uJ09MJekdI81MBLFGqBVNFFD3EhUGAY/7PKJwqAtwlF+XRJ4BDvDdOsG2rLOrEuRREpHK
	vZV4l0MusJu1ovLDRdI0S17jpb3E4o663cDx6MuDzz5chq9GqRCcZ2HjVM9+8fW025xa1WHV3/9
	d7vrEk4c
X-Received: by 2002:a17:90b:53cb:b0:356:2872:9c4e with SMTP id
 98e67ed59e1d1-3567afe7649mr2129330a91.13.1770808581422; Wed, 11 Feb 2026
 03:16:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com> <20260211093527.2892297-3-shengjiu.wang@nxp.com>
In-Reply-To: <20260211093527.2892297-3-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 11 Feb 2026 19:16:08 +0800
X-Gm-Features: AZwV_QioVTPx_waJOo959nlczDUw9t9C76e7lTpAVfsrBU6_oLABfAgvqJj0ovA
Message-ID: <CAA+D8AOXGbBurD1FO_rXhanDisO9zeNn+qp3ufp8A6u-CJxwcQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: ak4458: Fix the supply names
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
	tiwai@suse.com, ckeepax@opensource.cirrus.com, 
	andriy.shevchenko@linux.intel.com, nichen@iscas.ac.cn, 
	kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Feb 11, 2026 at 5:37=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> According to the binding document, the supply name characters are
> lowercase.

According to the change history,  seems caused by the patch which
converts txt to dtschema
So should I fix the binding document for this case?

best regards
Shengjiu Wang
>
> Fixes: 7e3096e8f823 ("ASoC: ak4458: Add regulator support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/codecs/ak4458.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
> index f81cd8cebdd8..bfd4c039bbb7 100644
> --- a/sound/soc/codecs/ak4458.c
> +++ b/sound/soc/codecs/ak4458.c
> @@ -24,8 +24,8 @@
>
>  #define AK4458_NUM_SUPPLIES 2
>  static const char *ak4458_supply_names[AK4458_NUM_SUPPLIES] =3D {
> -       "DVDD",
> -       "AVDD",
> +       "dvdd",
> +       "avdd",
>  };
>
>  enum ak4458_type {
> --
> 2.34.1
>
>
