Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F89C3546E3;
	Tue, 30 Jun 2026 19:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782847780; cv=none; b=bflmibToPHl33t8AThIP1J33OKzE+aGBbdF8VueO/ekqewobGd5H8b8qN5ovJzY8+63NaKOXETST9TqzWfYKEkWXwzFJJpN/VRfXh3LcnWY33y58lbzqN0XJPWAy/5RK0dZ9eePzyv3GVtCTwHhR8VVqU4FWvstaExcqdQdzwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782847780; c=relaxed/simple;
	bh=UQ7idkB16oZNRvqXTN2t6ylLNnnQY2/bylqkdCXbOl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XO/okQDmkxhhblPrtRBqgdoy9sPDisbmHu7aeHwLmPVHEO2S+kA+ynAbgJWOQ3lJAn8qv/zD5O6BxZRCEmvchQ/ERBlUFUgyxBZcH2ZeBk314glVq5ot6FG0HayDah5L8iahAEShm9j7c/TE6LCn70CaG4VFELkiu2GIQTeIDxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJDH9bzc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJDH9bzc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E96F1F00A3A;
	Tue, 30 Jun 2026 19:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782847778;
	bh=odnUHalfYdPtqwxNosDeWzdGUVRfJ+3jIreFbWqBzgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HJDH9bzcHH+i0M7vrMTEgoO/ZxE7buAfX2khrVdKutK/Zcj6WS/8CS94SWG9w1JBi
	 HIkB1V7lRt5lnEgDHdBWyBOWJgcL/9IK1CaowNqGUWtxQtubfMV5jKXQ7py1ZZ0dGe
	 JsOC1YWdsvrc5Rwpfnff1/8dAgjXYIhtowgbgN/T9hG2HX+Wb3frYY73YW8A54KrDF
	 f7fw9sgdxdnRj2860w0b1IEXgT0c/IBl6KaNyvew8W8ZH2I1ykyypw6EXFzXgi7VxF
	 YkDXvry15We7qzkV7vHSbt+YEEHZe2ri3LfuV2cKoDMlql1cl8K/HFpAx6JoChWlkr
	 VGRaaar5vXGgQ==
Date: Tue, 30 Jun 2026 14:29:37 -0500
From: Rob Herring <robh@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: qcom,sm8250: allow TDM slot
 properties
Message-ID: <20260630192937.GA87066-robh@kernel.org>
References: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
 <20260630091605.4043426-6-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630091605.4043426-6-prasad.kumpatla@oss.qualcomm.com>

On Tue, Jun 30, 2026 at 02:46:03PM +0530, Prasad Kumpatla wrote:
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
>  .../bindings/sound/qcom,sm8250.yaml           | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 15f38622b98b..c82c6c521f40 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -90,6 +90,19 @@ patternProperties:
>            sound-dai:
>              maxItems: 1
>  
> +          dai-tdm-slot-num:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: Number of slots in use
> +
> +          dai-tdm-slot-width:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: Width, in bits, of each slot
> +
> +        patternProperties:
> +          '^dai-tdm-slot-[rt]x-mask$':
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            description: Slot mask for active TDM slots

tdm-slot.yaml already defines these properties. Incorporate that into 
this schema.

Rob
