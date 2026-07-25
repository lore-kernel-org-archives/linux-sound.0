Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E9B305699;
	Sat, 25 Jul 2026 16:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784996659; cv=none; b=oiZ6xKhTZPt4eEF8Dz7T/N+Ny6Yr84nt8U0JOx7FiAJ47rD0G42sPkNftsNmza7PZVrcE3RBmSnxFKBzxlz5UgPfVmqWWqwmcnSi/pozahS3mCmMHto+77TeY6sIAa6RLXzZqChynqloS59/Mr2bpO+hB6ZxlnaMo3rKcjLmRY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784996659; c=relaxed/simple;
	bh=uZ0QRJrp6GqHFlTidnHABnd+2xXwdUIXoCkvVlx4QLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftkI3jg285u2AoGpxAz54OLjk6iP0kp9T69l5uXtSRYHInIAfjGtluNVMsItKIlRMRuBKPNwoUDg13psyXHrixXJeGUyQFuUxq1O0tpEp0MrHuVsslVWj8cy7/cYUnduyp4q+2ViRD2Egq0SAWRBzK5fk/BSCtntIjdmUlU7EY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QN6vEC4Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QN6vEC4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23D71F000E9;
	Sat, 25 Jul 2026 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784996657;
	bh=2RsgG2gJo5Gm52MlClEqOjdRpdETVAT/GcB0N7Ryr9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QN6vEC4Q/GdbOHRjcOYhOt4j/nJjV5TarEYlwpcFmulXzJQIQ/YjD/+9J0pMcHDqt
	 AIZ3RorvpEEgz5dsQIUZBDiOAEh8NPwM6V/UctpeWtZpwqAMoy5HQcQj80RG9V4F/n
	 l4ZpnZQrRsS6sgMI/2Bgt9U9Fu6eB2nfzJ86tUnKoUd1pZcYuma7SeSI6iqmtou9/F
	 JvswEDic4e8lQC6MiNR9XdJbikxC1MTNdeQVTZs4VkkQz+A0jQ1DpAQ8O5p96F4TLZ
	 LKbjnF3JiVj9nKTgu2MLuNqlcqKIj07uOIhVCUz7LvTq0K/wC9w9YRp255FygnKGRw
	 2nnG3TijLRIuw==
Date: Sat, 25 Jul 2026 18:24:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Message-ID: <20260725-airborne-hypnotic-swift-bff47e@quoll>
References: <20260724182446.1484894-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260724182446.1484894-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724182446.1484894-2-mohammad.rafi.shaik@oss.qualcomm.com>

On Fri, Jul 24, 2026 at 11:54:44PM +0530, Mohammad Rafi Shaik wrote:
>          compatible = "qcom,q6apm-lpass-dais";
>          #sound-dai-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dai@10 {
> +           reg = <PRIMARY_MI2S_RX>;

Please fix also the indentation to have consistent 4 spaces.

Keep the Rb tag.

Best regards,
Krzysztof

