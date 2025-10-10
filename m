Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5510957
	for <linux-sound@vger.kernel.org>; Fri, 10 Oct 2025 12:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099863; cv=none; b=JjQD0AVnZlZEmIQ8yuLyrOdZGj3oC7J8idb4Fx8T3Yecb3e+04TxFfxo7syQw+qBEBTntKS9uRUKwnN+wqfdTGPrFV4Gm9u35Dig/3JYY2B87znb1VVdNNXQ+4AImzrYAuTqUALCC8Qw6b0VyZF8+mEKARcHwlNVlhtzMzP67c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099863; c=relaxed/simple;
	bh=FzClrbjrEqRv/xjQzJWT38TrRTYaKK7xz/qIodXf1jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQ37Dalcx7jk+2i5m8YHnt97k95402CyX77X3BKACwe4SJHN2kZ1bADU5Omftf1dTbE0J7j8aL8xlyJd9JNuqfQfvStJaig3/mqyUJixu99oD/V/czbvXLnT4La2FGz2/Y/xgMEUCggKsvEuT2WAhgeEAF+4WWfwEkYK6ntxwCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzOE3AjS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzOE3AjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8337C4CEFE
	for <linux-sound@vger.kernel.org>; Fri, 10 Oct 2025 12:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760099862;
	bh=FzClrbjrEqRv/xjQzJWT38TrRTYaKK7xz/qIodXf1jc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VzOE3AjS0odI8edoQ6h01nT0kgfrle/RUfmO7Lw/pC4W+Mf5IsOKfFKjVLSnEggxN
	 5sk4YWmwOEpfsJni39w2hD4pni39i2BQ+Wbio27kyxXkUN6PDHpv/5NSGPA4ieM7X/
	 6x40sriSqpmfVxcjnQo42VkBM9+bDLIYKGmBTzK4+QkvZbL8ouzHgDckPPtngPKXWj
	 HouAuSk49Pn8qzgUiQAXsvGAJC9bJ+xf0q6ViTl0bTFcldy3k17oIbKDw25x16ofoB
	 v6sYzs7yevJmnSx40YhSmCEYYAl+jFm4XdPvj23gIbXA1JK8XuR/437r54Q3YP9ez1
	 Rn1ftR2w/b1nQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e44f22f15so294101366b.2
        for <linux-sound@vger.kernel.org>; Fri, 10 Oct 2025 05:37:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW62uDipYJGmA1kiN0TxMHZZWOGr/WRowXF6NCekiYl7XntMEQ5LITFONlFMbpwAwl8ZL5KRrsU0m9oNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJST/yCEXqORUYcGDKDIsZOVAr5iQ/u+loD1frQwY5LMRSBmK6
	NTQWKMbkGWxmfwXxrxa2aqdWV/EwqPbJ4W2L3KFKSiFoTCwoqmxCt1W+++FpTyYKluQTGLRnbnG
	WjjQHlCdaM07tM/GRz5XVc2L7yp5QNg==
X-Google-Smtp-Source: AGHT+IGBfdId2xOqPFSyPpgfeIJHQuLK4TGjxZ5FnQdownP+UCJpNZuLxcTbgHzTsZqQYW4/D3kSN7NUXXPIuhIYdnE=
X-Received: by 2002:a17:907:961b:b0:b0e:d477:4972 with SMTP id
 a640c23a62f3a-b50aa7a086amr1275250466b.25.1760099861528; Fri, 10 Oct 2025
 05:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251001150003.417472-1-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251001150003.417472-1-srinivas.kandagatla@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Oct 2025 07:37:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKCG-zY7f-gX6jwXXbE_uha-z1seqx2Dj+rS685DuzNMQ@mail.gmail.com>
X-Gm-Features: AS18NWBbuq0Y4UeZ9RroCyCV34TGF9G0nqMZ2dAG4m1y1D0Ujlkw-gQqUKpyAtw
Message-ID: <CAL_JsqKCG-zY7f-gX6jwXXbE_uha-z1seqx2Dj+rS685DuzNMQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: slimbus: fix warning from example
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, krzk+dt@kernel.org, gregkh@linuxfoundation.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 10:00=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> Fix below warnings generated dt_bindings_check for examples in the
> bindings.
>
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match
> any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
>         from schema $id:
> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
>         from schema $id:
> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
>         from schema $id:
> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required
> property
>         from schema $id:
> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
>
>
> Fixes: 7cbba32a2d62 ("slimbus: qcom: remove unused qcom controller driver=
")
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/slimbus/slimbus.yaml     | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

You missed the DT list and Conor...

Acked-by: Rob Herring (Arm) <robh@kernel.org>

I would have picked this up to get it into -rc1, but I don't have the
dependent patches.
