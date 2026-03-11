Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011052FFDE1;
	Wed, 11 Mar 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235009; cv=none; b=uU7VLTLy3HPAxw8ok8GyjAwdtHLf7pcCX59BFVW3crGX1g4lTBL5xVWVkC2rRyTEoPB38iagDfj4EkqKzCYIdwL6MR5lFYoJwtRyuFCWm1H392ekcfY0eRtBMKFdWXCLCwZiL3heZKdWa0GoSwuM+8n0OSkSM6wUQl8GVFfRzfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235009; c=relaxed/simple;
	bh=JzqP23N58g6pyKhyaXS0PhblsH5uS5tXS9VBTLAteO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc8mQI4J35w73NM3g9kGHba7aihMh7O1DBk2Qajfo7xqx0uMJKMwR2N2vvGw7IxJmHqfr4U24Y33DMmJ26TI9ZXqQtzrQ0Kik1teTF2TRR4MzpZkyXINCYDDyc5BckokFeTxHoNWQXCN7DkDUQrLRHcXB6l6L4Uxww4sWpeM33A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+Yvuni7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+Yvuni7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39AF9C19425;
	Wed, 11 Mar 2026 13:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773235008;
	bh=JzqP23N58g6pyKhyaXS0PhblsH5uS5tXS9VBTLAteO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+Yvuni7S7oFtvk7f8vcjkiZT4OA49RsdUZTchythEBCVtbKzVGaZ5EEZzFTMBk+0
	 igfYB/FFE6RWIdCu3kKB8nNBxA8HjSg8zHU8xXaJirVFlfzyVt4eOULy2ETBrCXTsI
	 vnLO8/QzrFo34RS+QfPInTqvANRFfMD1MoqIvyHbG5IDgu6o+7TWhmWO1hKtYIrdiY
	 vCm7P5gIiV6PDsMFAn7+59jGYrNGkoflR1/Y6sz6mE+OkZOC4wLRq/38pJr98sxCA9
	 q4Dfr5nrjvD3ke4blDxH+A7fMXCLNHKY4gqCrnYMyk2WZyfFl+GlmbwM02Dv1jBbkH
	 cxnmr3fDyWu/g==
Date: Wed, 11 Mar 2026 14:16:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Document firmware-name for
 awinic,aw88166
Message-ID: <20260311-liberal-reindeer-from-hyperborea-40679f@quoll>
References: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
 <20260310-aw88166-fw-v1-1-2777563bb673@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310-aw88166-fw-v1-1-2777563bb673@gmail.com>

On Tue, Mar 10, 2026 at 11:43:04PM -0500, Aaron Kling wrote:
> The driver currently loads a hardcoded firmware. Allow devices to
> provide specifically tuned firmware, so the driver can use that instead.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> index 994d68c074a9f221576a5bfef6ba125e3e30bfea..e12d030475e24dd11afaa3c9af4b53703f25f981 100644
> --- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
> @@ -48,6 +48,9 @@ properties:
>        Flag bit used to keep the phase synchronized in the case of multiple PA
>      $ref: /schemas/types.yaml#/definitions/flag
>  
> +  firmware-name:
> +    maxItems: 1

Duplicated patch. Please work on next or maintainer's tree.

Best regards,
Krzysztof

