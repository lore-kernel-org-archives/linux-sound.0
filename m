Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09372DEA8F
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892191; cv=pass; b=XiVVmLBaWzddhMoJNY3Dsz/Bp0rWbBV0d+b0QSYVU03xLi8Cgxc148u9vbfk3CF8r+DmFz7Y+7GkBtXACgQGplFFShXXvqiK07bglEPCIj3QPLJ9GUPd6Q32EguS1Me13GuSfwaN8CSKDIpsCaBUd/2OqrwR5IBPnpImG/Ej9T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892191; c=relaxed/simple;
	bh=2a4Le73LBQr/hZI/otLXD8JXTTU+ceipXIWhUtHl5Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhSatRCEwavrQcSMG3oxWHeol8Mf8wvbhA5mZJ1zZhQqhHplQg6x83iMBUrpB9DfEtW6MtEdtCwl+ttpXM48xT1ls9cyDNvQ53Og8Dgu1MvAChzIje1bMx4pSde3Kbmm8dPqLcB5Qm7k4/a31HUolH1XgtZjs8I5QbRdwJThRsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDXz3OzX; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDXz3OzX"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1248d27f2b9so9482724c88.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 02:29:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770892189; cv=none;
        d=google.com; s=arc-20240605;
        b=lYm5NtcnyIlUxZDZHy4ks2V0O8/bTqa/ouFkdJw22RrOZ3gBv15pnqZs8j5Qjp6rJZ
         GcNR5CNAXi4lHyR4RY/ioIq1a5xKLXeaH/L+u46PCr+2zcRzY2dV5kbAxhn5M/PQP4xD
         dAWOFsYmLQOsUKhUqOjqaK+YnEcNIJhAtH83zSGP4b8oaS2gz6fhAFlAjBBmHHKnIa08
         dhU2mKanRqIIYSMrM0NApJPwygJIO5lo4sR02IUYqmorUkbz0ExZT+X7rHM5eQuLiwL1
         O7NGcO/GyatO637yUEuGSz0gbMP98h49c84jXoxGsVO//aw+hXWzd+jNHI3MhlZUia0o
         cSmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2WNwAh7MqNpr3gNRm798l0GPzFsj9dN4fIN0L2pm3tc=;
        fh=nWra3KjsHjc9fOuORBklKlCuPyjTtqq9UNfWnWuTj+w=;
        b=H1rrpphEDP89G3EAgzXOXA6GZQvm7/Mkfqgx22N4GlQY59ZWkwg2FdeWtTxa38A4zL
         /KzCnwbz1cp/af1vBcKdfpuH1K+ZlGwYafDWVOcPpNN0F75q/RXScPVjxDPNRRh1rhti
         +e5PrweCGSqEZor+wqHfnhsifHmw7DXdkaYJBb4onYNCCN9DU80fL+yEz8UA7C5o/3Li
         7jT+1o3/TKp5rZMdHJAiiFImvCrqnnD2Ph8dgJ2ekbPTSm7SYEkTzZ/4Rym3y26OFA8X
         LP7OBSv348YDOsldPuRgf25Qw40ODQCdijQakE8jLsrTv/HN1pyoM1ENtmh9a9xk+tzQ
         vNfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770892189; x=1771496989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WNwAh7MqNpr3gNRm798l0GPzFsj9dN4fIN0L2pm3tc=;
        b=NDXz3OzXkUzfwFFAx0wbxiUoclPnmNV3SkSAGu60nYnx1M8rW+RsI0CJzhEgWyQb9G
         1Vb8C/OoPQmTjddg0LbQ/MQIepPQabnBJiBjLQ/OZ9SuKlZulUeAI5YNwBu/WcBPCrp2
         l2ZSfA0/6Nsrug9V3N7mKMT9KzK7Z1ATSVJodlLobIh3Fn7Wx/TStvyyQlHR2k4vx9ef
         Cae8Ia2EbZFmoVh4MPjwJfJfCL+1c2BA0XNllrz0aLkoFYSHz8mX/45oitPzVVS7DAPX
         vZBhQIMPsNOEQfJk4KgOGvMZIVQ0qPJ0pV+0tOALCeeZG18xc+E3qr0w0KG3uC4BjKt4
         zmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892189; x=1771496989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2WNwAh7MqNpr3gNRm798l0GPzFsj9dN4fIN0L2pm3tc=;
        b=ROCD/WuNluwuvpO9p7VBEqDdD/PPqHZaMVDSO6U8/Ylf6lknEwJkgHkIrpp0IPtYkQ
         wvQQGQQw43tvBKHKhofcGHV5SumowG6RKDVW6SCHfxBcCGH5o7GYTAFqWFk+2zfgCwIp
         SniXwqJ4xPvyQIza7r7gAe8qQQ8D79YCuWXLBY3GwNTSDk+LefI9ci6DpJTP7U4xJMl3
         QmguPnqpkymOLNcLC0eb0ASyBgxSs94gpYo68rJo1lNxDbMbp5rAUbLcW56onIIqtLDK
         8ZyMDxe8y1R0D9VavNsE0bM43Rlmi9tJMzGHzLsrhMoEIAniTgnl7uS4OPt5nYht2bO/
         y9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWIJ65xM8MUygTXZ7TAyWAzjI75Jms2CeqtZGANdZ20vZg8IqKR7KfMFLxE0lCNl1JN5t/eE3wnSuKxDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUdU4Pco7OTrEGDIU5NWOd0nagOI6JCX+GCAj/F/NYZrP/6yg7
	QdRckjBlVVgUTMk2iD51sSHyOBJ9j9bd0yyk5/8EBV1lNE1hQSWfEZwuNifgSSJLhzQpOf1jb5F
	zuE1BftHx0EGxFl16QcHnurofMio9LKk=
X-Gm-Gg: AZuq6aI/4q78nP2SGvTd5veACorO56ShRuI+6Kp3re4rRbgB9gVaxnCBhLbDlTXvSR4
	I1uphY2cQHS8v9+hK0VwGYA2ORbOGRK//DoKGpUKMh6+fDONeHpRjTmmPxfAAKiL3g6mHnxhJMf
	3pm6NmfTI1Sb5mRcStvMCcOOFsOJ6eoGAc8Fopm20ztJzaXIzrqTcE3mV5GnW5t2nETg7jyPIjX
	RagYbZmsZQYX3VZTyN2W7uzD9W489HYOjXTiiGC9mcvorVWU1Wf3BM8gjUOev5u2xHQJw1whiyl
	uS9fp1EaW7KotDGohWI2L9n5p05ja0R2BNTB1cQb1ibyaNQtHxAv3yuKbvSBK0BYVHpncEVJWoQ
	AEayvjzN5asa5RFvCOgvopQ==
X-Received: by 2002:a05:7022:e12:b0:11e:3e9:3ea2 with SMTP id
 a92af1059eb24-1272f7b0683mr1034840c88.49.1770892188893; Thu, 12 Feb 2026
 02:29:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211214646.3700533-1-Frank.Li@nxp.com>
In-Reply-To: <20260211214646.3700533-1-Frank.Li@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 12:32:32 +0200
X-Gm-Features: AZwV_QhhFT0cn79ldAjeoBPb3aybubF9rpuw8kM-MYNYPOpdFzKmXW-eCrt9Hks
Message-ID: <CAEnQRZACes8EptdEgg0i0vzdcxgUJwZAfQHU0DEhMnXtA-g01Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: Convert eukrea-tlv320.txt to yaml
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 11, 2026 at 11:49=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Convert eukrea-tlv320.txt to yaml format.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/sound/eukrea,asoc-tlv320.yaml    | 53 +++++++++++++++++++
>  .../bindings/sound/eukrea-tlv320.txt          | 26 ---------
>  2 files changed, 53 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/eukrea,asoc-t=
lv320.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/eukrea-tlv320=
.txt
>
> diff --git a/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.y=
aml b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
> new file mode 100644
> index 0000000000000..483507fa77937
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/eukrea,asoc-tlv320.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio complex for Eukrea boards with tlv320aic23 codec.
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    const: eukrea,asoc-tlv320
> +
> +  eukrea,model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The user-visible name of this sound complex.
> +
> +  ssi-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the SSI controller.
> +
> +  fsl,mux-int-port:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The internal port of the i.MX audio muxer (AUDMUX).

Same comment about port numbering applies also for mux-int-port. So
better add it here too.


> +
> +  fsl,mux-ext-port:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      The external port of the i.MX audio muxer.
> +      Note: The AUDMUX port numbering should start at 1, which is consis=
tent with
> +      hardware manual.
> +
> +required:
> +  - compatible
> +  - eukrea,model
> +  - ssi-controller
> +
> +additionalProperties: false

The driver sound/soc/fsl/eukrea-tlv320.c allows an optional property
named codec-handle
so I'm not sure additionalProperties: false is correct here.
