Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E9439345
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 18:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535671; cv=none; b=XXEvedy/pyHtt+dK2xtCamyIWLHvDU9Twv58PvKfmteS+/5P4NYRfGw4w+KuzUoKqDvdtdIyyUvXGPnm9Qxk1OsGx9TLuOtDaahHOtuhc7fDr3IzEPBa0KKzSP0IQHHc1z9cX5VyUdxrgfGgHrzb2s6CQyibXLVYUVtkqP4FngY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535671; c=relaxed/simple;
	bh=b6jdtPw+VxpSgFvULqrP0SVRKXGKPjO4Y4wcBsjOyRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FscxdyxZ2pq+b2jViFyr1KRsTdvFcXckQTEoGsnBxlUOl8Mn7kMjsMQciGcR0ck30vp4YxDCwrUqBbTBDxcitUoCrUNbixVm2GgescITw4/wRjXG1cVLNa3HJw6suM5HQxZ3Vd9aIGKNmYCJojFANZ6+KEJ/nS3mJ/LFqLwjMGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSGiKblq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSGiKblq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF731F000E9
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783535669;
	bh=9cdd1YNFo0BBLZoe+c+X6zyqzkgIO8DBHV2jMSUh/60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FSGiKblq9dC+28fSlbwXdYIDvwrJgAPOv1wFjq3dBgklv3uovRn4cR/WIkikGAY5d
	 8ovGAfyyI/9Qr8xWGJDDHzv36aJAER0GDZloi69abl3SRSKPOBm4QtAPi89TFLHnYh
	 iad5LILFZEFcIbPzDAVfPJSLjTYBSKfqdrTG41QmKButNojOJ/yONpDvVP7mEFx+WY
	 Dt1wiDMlJhkHEmK6SOUOE29+6YzJVC/0BF5e/Chgh48jILSLpTsOLsvyDKZJtXIsOi
	 +zphAdRSK4cF8bNFmzbocIigoPlXIqhVx+ApylRiPonPcJMzN1icwLCzJrjr0xNoQL
	 1F8AvRcfmUqow==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso104445a12.1
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 11:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpUl+cu73zFs7CSrF5QF29ou/7Il6fXCnIOxoony+tnvuc4n6J0Az9fskROmSq5h5j004porknUGoN7yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIM6hUTrKxiMohThKUMur8TXevuw7e5emtq8Dm1gQD0nGDec7
	AOFui3WeauV2R9OaU6A5Vq58NQwW8qD95zBnKvj0Hu+FxotSm+a/mYB5GmgviVjuNr18I//hnWA
	+AvB8i5XcK2gplaTnYVgp8ePbL70tkw==
X-Received: by 2002:a17:906:268e:b0:c15:c108:dcd with SMTP id
 a640c23a62f3a-c15ce122ce6mr134397666b.49.1783535668618; Wed, 08 Jul 2026
 11:34:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com> <20260707190106.2876465-6-prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260707190106.2876465-6-prasad.kumpatla@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Jul 2026 13:34:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJmMpkhry7S7EMG7V8T5-rJb-314ymEoT-nAJEgYisSOQ@mail.gmail.com>
X-Gm-Features: AVVi8Cf_odeuEAHH0gUHkPQjs-lsaY6n8LwjnSMkMCAA6H-6roX9xLgiTdq2FkY
Message-ID: <CAL_JsqJmMpkhry7S7EMG7V8T5-rJb-314ymEoT-nAJEgYisSOQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot properties
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 2:01=E2=80=AFPM Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> wrote:
>
> Allow the standard TDM slot properties in CPU and codec endpoint
> nodes.
>
> Some audio backends operate in TDM mode and require the slot
> configuration to be described in Devicetree. The common TDM binding
> defines dai-tdm-slot-num, dai-tdm-slot-width,
> dai-tdm-slot-tx-mask and dai-tdm-slot-rx-mask for this purpose.
>
> Permit these standard properties in endpoint nodes so TDM-capable
> links can describe their slot configuration using the common binding.
>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/D=
ocumentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 15f38622b..a45a1a00f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -84,12 +84,21 @@ patternProperties:
>        cpu:
>          description: Holds subnode which indicates cpu dai.
>          type: object
> +        allOf:
> +          - $ref: "tdm-slot.yaml#"

Only 1 entry, you don't need 'allOf'.

Rob
