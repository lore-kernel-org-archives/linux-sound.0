Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDA91CDA3F
	for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 22:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730414888; cv=none; b=ToAziA1San1Fb1XpvjlXsMRidwe3/Gd87AzuhV5K6Kvf43ebEVHyuvc6OWCTNXe/Ei9bSAxstCIcWCcUvSy/G8YuJ+Zp1VWur6SfFRA/3b/U5X39B8nDHWelOS3b0+kPfPjgG0WSukNZI+DmsNL3gw1/EpIVFl2Tl7DNj6npjog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730414888; c=relaxed/simple;
	bh=dKICqskpU+lDAaVFQjimpvgZuImNCCQ5RSIvqwp71xE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qjYjzQBreV37n0KfbldzRYA8/3tJ2UWGjLu5N039EZIBwFIm/REuTerSzCx6dAkfZnT33qM8sjQpv12QD3NwCx05zaays8vaAIah3psZlWOG93tXy+LlkVAL9RwOku9nZpYoGdIOMgscn3g6qykFMQuBnI3v5Uz4EixBGpue2jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BIQkmEMx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BIQkmEMx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315baec69eso12044865e9.2
        for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 15:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730414881; x=1731019681; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTGe9PwYvoojfRJpUZgUhAxbJHxiXthHeHJW83hgHu8=;
        b=BIQkmEMxnpj+5iaC/CJK6UU8d4cJ8C2yB2NauBlOmp03k5MYdgr0yGjGgJ4m9NuWES
         GUT8TX45unHLjBQeFEYD/WamKwJd2vFET+aei9cV9AIr1HXEhTPjpREZg5bfC6HQXCg6
         MY6r1yA2I8lmH5qLl+FL22iPSe9e9O/wzCm3UrBm545gl/m//I39pVbxaGmEsE9f1xCl
         EQbE5dZ20ks+BeeMnDM6uUmCVUPCARw9OZVt6BnRlc8HaIsIUJZpC93MlhPEbV5mN/gg
         HBo3lFlQpn1cENHD2ssErDLurTFB3v/qqwOwOwNQWPSc9JIynweHYAEqadAms0CojruC
         KH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730414881; x=1731019681;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eTGe9PwYvoojfRJpUZgUhAxbJHxiXthHeHJW83hgHu8=;
        b=ovMBCZRNQoRLZqontVUC9PxJre8/Km30rEZVTFX1C/8hYzPsibVQWVLxKXoIT0ToWe
         axZTLumSNWm2BGQE3prNvsfI/Wl/t449f6CzhXCiDhtomlSLQe/zoW9QNwse7R2RZ48m
         VDzfwy+1UhBdZQbINg/XOO+zyPmE9dy9cndjsIE7P092usmc12FTtm7rQMCXf9O97aKj
         njkRfgI1lDS6qHDKTvtOvnOzPUYuji/Nj5qmSEN+5GRKaYiVn0uNkpsA1qegw+8NY1cZ
         uZxMI6YOAh1ZKyiEVytjaaWQNvVcNIdzDjUGfHhWl9HEveOO1x8F549Vfsosxpe9vFOg
         67mA==
X-Forwarded-Encrypted: i=1; AJvYcCWENoW+1lZsfB/h7fP0dTAsLAl4KZDN1IYnlUtWdLjW4JYpAryHB0bJmZ8aWWL6hZ1mnWCiW1s1WIXNPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOvvhrK/50JBcv5/RD/3oC7NaD3datqXqp3VHx3HvooGnMKHhy
	VcZpQfL/wIhK58i//n4PlkAsMPdWmkJz8d6X339x7t27GO4PnR5hJywNSCLbY68=
X-Google-Smtp-Source: AGHT+IEmzHNzE7hvDqBmKYm1F0qTKl7W/SJiQtEF8C1xj5fDoK069HdbTE+fuTkxJTbnplMq+3q1PA==
X-Received: by 2002:a05:600c:1d21:b0:431:518a:683b with SMTP id 5b1f17b1804b1-43283255a45mr13080605e9.18.1730414880954;
        Thu, 31 Oct 2024 15:48:00 -0700 (PDT)
Received: from localhost ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d439esm3327963f8f.44.2024.10.31.15.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 15:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 22:47:58 +0000
Message-Id: <D5ACVOXF0KJK.1ZUDOAK4X9EP8@linaro.org>
Cc: <lgirdwood@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
 <krzysztof.kozlowski@linaro.org>, <caleb.connolly@linaro.org>,
 <linux-kernel@vger.kernel.org>, <a39.skl@gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: qrb4210-rb2: add HDMI audio
 playback support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <linux-sound@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
 <broonie@kernel.org>
X-Mailer: aerc 0.18.2
References: <20241018025452.1362293-1-alexey.klimov@linaro.org>
 <20241018025452.1362293-6-alexey.klimov@linaro.org>
 <33736e2e-7ac2-4ec1-9d83-eb8360942bbb@oss.qualcomm.com>
In-Reply-To: <33736e2e-7ac2-4ec1-9d83-eb8360942bbb@oss.qualcomm.com>

On Fri Oct 25, 2024 at 8:09 PM BST, Konrad Dybcio wrote:
> On 18.10.2024 4:54 AM, Alexey Klimov wrote:
> > Add sound node and dsp-related piece to enable HDMI audio
> > playback support on Qualcomm QRB4210 RB2 board. That is the
> > only sound output supported for now.
> >=20
> > The audio playback is verified using the following commands:
> >=20
> > amixer -c0 cset iface=3DMIXER,name=3D'SEC_MI2S_RX Audio Mixer MultiMedi=
a1' 1
> > aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav
> >=20
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 55 ++++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot=
/dts/qcom/qrb4210-rb2.dts
> > index 1888d99d398b..5f671b9c8fb9 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > @@ -6,6 +6,8 @@
> >  /dts-v1/;
> > =20
> >  #include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/sound/qcom,q6afe.h>
> > +#include <dt-bindings/sound/qcom,q6asm.h>
> >  #include <dt-bindings/usb/pd.h>
> >  #include "sm4250.dtsi"
> >  #include "pm6125.dtsi"
> > @@ -103,6 +105,51 @@ led-wlan {
> >  		};
> >  	};
> > =20
> > +	sound {
> > +		compatible =3D "qcom,qrb4210-rb2-sndcard";
> > +		pinctrl-0 =3D <&lpi_i2s2_active>;
> > +		pinctrl-names =3D "default";
> > +		model =3D "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
> > +		audio-routing =3D "MM_DL1",  "MultiMedia1 Playback",
> > +				"MM_DL2",  "MultiMedia2 Playback";
>
> I'm seeing a lot of double spaces in this patch
>
> > +
> > +		mm1-dai-link {
> > +			link-name =3D "MultiMedia1";
> > +			cpu {
>
> Please add a newline between the subnode
>
> Looks nice otherwise

Thanks for noticing this! I'll update it and resend.
I put one space between audio-routing widgets, not sure if even one
is needed though, maybe there should be no space at all.

Best regards,
Alexey
