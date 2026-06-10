Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E439A3A7F59;
	Wed, 10 Jun 2026 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081462; cv=none; b=IYmAufVqF9UU17U7YX6MKk1gKY7osyDOPdCfmLggD4hdOHHVuGzUhCqCriGXWAiBc+IgvDVZsN9kOVigkQOYCU6bRUH8yCq9CbgvzypV3UFu5XCRIbv1Y17WQoleJIbaC3gzxvqzVkpH1tVRJi8GcBUKRRgmtq+nrU9Tq+cSHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081462; c=relaxed/simple;
	bh=n13i9DN+x6itolrXfeCRqK1ypg2cYsP1x0umNA1LFYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6l+sd9xybgXbAnVMrtt7QCqJ+8k6cpnv3+SVg/hbYL6An7DxhPvb8yT24ihRoYdXEod7DHNJJ08yExGqvqf/GDB+lsiHR2TfwXySiP1nLv2+RiDZP6VjE93yXgCxB20JBBhYWLdYA+2Na6q1vJVazHJLB7+aobFGt9Gp8Ox+tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJWYSfGI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJWYSfGI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89411F00893;
	Wed, 10 Jun 2026 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081461;
	bh=nwFfqw6RTmiqHr0J4pBOGyY2zipkP9FlsxvhdxTXaGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJWYSfGI1h2OdJnrFwuzsE0a0y9u0fzo9Wnvvlld4CPgKEo8Oxi4fdDxp2iQIuxSn
	 QvZWmQBerkfiK2Hoc5+vS5vktoY7WdfZxS0qJ7G+p73MTOxTnXzxtL8sYdbjvmNxkl
	 7nuqEAKaHr56UW/5wYARxc/zCH4F7S6KIXxJrd8cqsZruizAl5fa1g9lQ30ytSqSaY
	 acH4rFINzwrfg/ylDJl4pP+wRzmx9f0f3hiyEB951jgs7jrVczUWNs3F7K2bEo5NSK
	 MV3Okvx+CRyrThr8xGhaZ4Yts9qNNGkTe7RZcEhX21dGZ5gQmEneQpr7eVi56MRCkQ
	 iG6hpuJ4sOfAw==
Date: Wed, 10 Jun 2026 10:50:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v1 1/3] dt-bindings: sound: qcom,q6apm-dai: add optional
 qcom,vmid
Message-ID: <20260610-silver-pelican-of-agility-86fcbc@quoll>
References: <20260609064038.492641-1-ajay.nandam@oss.qualcomm.com>
 <20260609064038.492641-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260609064038.492641-2-ajay.nandam@oss.qualcomm.com>

On Tue, Jun 09, 2026 at 12:10:36PM +0530, Ajay Kumar Nandam wrote:
> Add an optional qcom,vmid property for q6apm-dais nodes to describe
> additional VMIDs that should be granted access to PCM DMA buffers.

No clue what is VMIDs and nothing here explains that.

> 
> The property is optional and bounded, and driver-side validation will
> reject invalid values such as including HLOS in the list or VMIDs that

Driver is not relevant here.

> exceed 31, matching current SCM source-permission mask handling.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,q6apm-dai.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> index 9e5b30d9c6e6..b767625985a7 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
> @@ -20,6 +20,16 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  qcom,vmid:

Does not look like property of a DAI, but some sort of SW policy how you
organize your VM guests...

> +    description: Optional list of destination VMIDs to share PCM DMA buffers with.
> +      HLOS retains RW access as source owner and must not be listed.

Best regards,
Krzysztof

