Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F2F355F57
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 01:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768723; cv=pass; b=uQ7zYJpaZB3D6Zmk+qfEOfbcjdvahjqNDMjHTlqNrP1QTTm0ueNrkedwhd9bosEsCMFI5sO7bLP3G4wTkU9IuKjOhqFGcDA975Eh2TLs8ViVcYOm+sBQcyXmyISd+bxr84e9QK1k8lti+gNLhDzgk3Y1AMmmRTvdWZu9S6R0prc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768723; c=relaxed/simple;
	bh=vhUDDHake6PjVodeFYRTd89BpqCVb70Env0+ub9W+Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auU3MJAJY5+hiD42IvTv/bgjuKx4xJdJtnw+iwq32CedWDucx2tTjX0/QujpWfMJiDzzswhEo4wgEMZNzn5RecwvT4NS/ZD6EjX5JtTNAOiHO+bJSNaqo7ntsOGA3lLP5kEdOJDzThed9WCdDwlo6f34MRWU+FNWcKexyCddAIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCGQwL4a; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCGQwL4a"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a2757826b9so642196fac.2
        for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 18:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768720; cv=none;
        d=google.com; s=arc-20260327;
        b=XSrjKzKBBzU8k/7Gs0c9XMsaiz4NMSrp0F4urkrdV+5vzdTIv6AUK91B6jl68wp1NG
         uTrI+7EPbvcfn/2RAwvb+8enE/J12MjGSq69Q8O1wTnfKZFYKzVKRqR5AJ6fTs0vRk13
         FwNZfbun8t5eLHpey+xwypmUZ3ADKQCUyomtED8SePetfdw3hTsmrLU0xlWUvNonvU0W
         T2siSw+ROlhO07kAp3fVnNXwMWuJzjNCiGLxweHAvYd8OltHPDscoamsMJIFUn/IFcAi
         uYE3GOwHzcPVi2Cb/uoduxunLWjG4+EEddqSV2ztni5pR6LvI2Sta8Kz+NcbHGLQoi3M
         B38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        fh=xybSrQdfAorrs8VUaGW9R3Bs8UjdxMguVy9EmrDcoJ0=;
        b=E0dTwUoZC2038s2MZmGWxbV0tW8NlSplh544O0Zpx9rQ4iGjXBPv6B2fGlCwMwQpVn
         t8abvEAd/Cv2k89pao/XQEKOY4qhRz3paS8ca8lauOtlgiVNAMBXEksuFnzveP+uLLku
         iLl/5FoQQq1ug1do6UpGkx0tn73m6/7YXDW8uwMmeZFuy2rx6yaQD8igHyFtJuouNIhT
         H9vKSFyDSzBYFGImSdkRl1OaS/3e2YiA2UNYOJvLIoc/RjtrABkXpjE7wqAviHmAOJFB
         PzghuXLTWoAYdFjBwCQiW3Zn1Pdr1KTPRlRbNfXrBWOTJyYy/aq4cNkI6VjL+cOcQO8M
         3Whg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768720; x=1792373520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        b=GCGQwL4ab1od3moolhk3hHqGU4woVDxfP/nPc5Z2Ra061NJhVqGDZqpfeQ+MpOV/Sa
         PFhkCfhjfe4kgJ4XxoXFqs4HYwiUWlu51BB2NILtfl+uixL0rcCcILPI7bIYFMzgGOpS
         TUs6/NKEcMmCBIMeAbF6iF/RKinW4f2yt7qd1q0uGZCC93M8jrpkPL9/XZ93bpK2Ela4
         c2uEUbLAo1BGHNDs6oeKp+txknqWavUpSPWc020TmDblTzMIRdYLUa1viSmRxdtqV+wS
         PI5HO3HsF7mLbB1Uv1XHuhywQJ9OPQkAk07guSXjoGi+v5UU8uI1nzPqC0Ev1izC91Cs
         AIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768720; x=1792373520;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDQUO9E3aLbOqLlDqGwF/awXVPyTQZEvQb89vn5yfsI=;
        b=oG6ts8K74yUX+CyXoe3qSdzfkjV5gzTxT2lMwouEvnZPmsSiLInGa5zpUsX3X07lsY
         zgQmZGbzTFXN8zLLXbIKMUlaoNMXziQ9tZBhnNo6BxLfxtfICDCin8x1inAgy5+Yttj8
         v8yBqEbPtMl4K/XHvoMuXfMF7tbtkFVFO5OE4MWPDYd+ZA3QXmtntJNXeS5w0gi5gU3Z
         uNcWb3p6+O8Gc7e7gjITFxJLiQ2Gbqxv6osXKBiRN25Oj9oYNuwy+tm8FWb4gGHdAg89
         eSwfmqsqQVh1/eryX1d/vylWmu6OiNbSZQAVt8wsNmUPKtQmj0KoLNRuGsOS3jzlbE9i
         CzmA==
X-Forwarded-Encrypted: i=1; AKwUvBz81fvlg9a30Nh39ehBkazoXE0A3SYWG+iX+C6Nt6hf7ZSgserjhy8yD81lT+6/Hgj7AU36llsbfcYssw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0EqufqF0Bqf3z18b23dY1+kLZp8hRZJhxP00ug+QSjtNq0TBu
	C77Vmb+wCMiVrtiZm/sB3wfkCjb7++V+ZhTnvpzYZSy2P9DJo91GZi49hq/h86pdFZv54AeVLL7
	tsff0cMj5uNwEy/Bx+RbSxIggXtJrE7o=
X-Gm-Gg: AYBFou2IRcQsriyT+89mhLWDqcFehogjX4r3m0Ny5X+V3yajbp2Hc5e9gTKavFHqaS9
	SqxpneWC27VIZ5UP/pt83W0j4g0dYiDXpPmY8gUpCsCMOlRyNAtilSytCB0qfe+PIW8uUn7unxJ
	s4i91ZzS0HaNZwNRCDgm4pHl5fb5U7LqAjQf6ciOVqClNXZbbw9KFyCPWt+iZyB0SjYxMTUqc7A
	QDKtdklPLCLcnTu0iXaX9p8Ov+Dt93tS3sBtf953kB+zOFsY7pXhBSoMt8i564RydRmcK6o2zoM
	laVNTHPtM0AUcoz6vvNs76t0Q2Yet2NgYaDJgGNfo7MAI/2oh7KYXUg=
X-Received: by 2002:a05:6870:b523:b0:451:22e0:9604 with SMTP id
 586e51a60fabf-4a2a86aca5cmr6021572fac.7.1791768720455; Sun, 11 Oct 2026
 18:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003175659.23536-1-mailingradian@gmail.com> <20261003175659.23536-3-mailingradian@gmail.com>
In-Reply-To: <20261003175659.23536-3-mailingradian@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:31:49 -0500
X-Gm-Features: AclHuK8whbaG7v0eCCsuN4wni82p4hRfYmu-N78P0lmjY_ExUyztPMiJe-8P32A
Message-ID: <CABb+yY3gCzgVL1qZ7XCapkUBr4MGfUO8NG3kXY_3QL9_pkHo2w@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
To: Richard Acayan <mailingradian@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 12:57=E2=80=AFPM Richard Acayan <mailingradian@gmail=
.com> wrote:
>
> Add the compatible for the APCS in the SDM670 SoC.
>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-glo=
bal.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.=
yaml
> index 39bc374300c3..74f24e07abc3 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yam=
l
> @@ -50,6 +50,7 @@ properties:
>                - qcom,qcs615-apss-shared
>                - qcom,sc7180-apss-shared
>                - qcom,sc8180x-apss-shared
> +              - qcom,sdm670-apss-shared
>                - qcom,shikra-apss-shared
>                - qcom,sm7150-apss-shared
>                - qcom,sm8150-apss-shared
> --
> 2.56.0
>
Applied to mailbox/for-next

Thanks
Jassi
