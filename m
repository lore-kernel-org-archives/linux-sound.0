Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5FF258ECB;
	Fri, 19 Dec 2025 04:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118611; cv=none; b=EKItLryWy3GHH7HQRKBjp1NLF50X2S9SAt+5P1USIRPxOwFs5SxLu2mbBMSKiBUz1U4kHPRkvjege6up9HipUl8gLOg8DPW+O3aTVOqymiFTkVqPGqymJv88g3srsFNuIUhrLqktSfxbrZiHn81DElwMjRAeDd/oF8WsSSusqLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118611; c=relaxed/simple;
	bh=tQ48w5dtuOe92p0iA3QahLgH9d2IZNXIgByp1F4qGHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTVd2qnprpNatc1GkybTqPuGm/6ATJX1tDvYsIrZJHYLY8h4DXtatUAWk0h/E6xeOQh/Wb4h17s0LiEgtwSaOCW7ZrPzANFqXClDN0xe8UfbF02GmUkyEIYlvp7qxBo3qGwZxjSN3R0JaEV8FSOn8gaSo0HFkc7NkX+mZASUj48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=B5mX9N6T; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=S7PGnjA2; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="B5mX9N6T";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="S7PGnjA2"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1766118174;
	bh=tQ48w5dtuOe92p0iA3QahLgH9d2IZNXIgByp1F4qGHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B5mX9N6TQzIo422awhmmFSNkGLLqsMZZ08AYZHnwHqasxcqmW4rYN/LC7j/7wZOqT
	 QeFzivyu7kiqejHzaySX4iURZ+WyvKXSa5yxMvl/Go75m1xwTHCJ8VXQRM3ll7h5G1
	 6QOvp/j3PTxA8Mjjn5YTxuj1UmH0946A4wpyIpJ6W4pNwLpWyB52D/JRArBRl6CQyv
	 kX7r3HrJvWhTMnTRolr1NWH/Lvr7J7gejGV/Pkx7TlDAddO5FnKs6ByxESItUY/wlm
	 FlYXW2sfRAGdv7a5bW5bLnlL5kzj1Wltel9q//hLRkeZGkGliJpAIFfao6zpf29LKO
	 ZpGNvlAdc3QHW5G6O7DpSpMURYXkXHKAUXxAzSK8h9lK6jxTRLpsdvUsN+PkxzM21v
	 ewBKJRZFGaL7COr8jCL+dD1KyrC1RmiumdGASXrjZMh2UU29BNO9gkNNJZIWL0g7qS
	 3GokLW3guus0RUNE22QD/rUef/8NERVQgJ/0y0JiwixjfdqRbKp2LPAGJB5q3Tjliq
	 CjuQrw8KYg6i9tAqHPraUhkqN1b6QwHcbLD6yiQM3FMdJnvpygI154cuK851rI8MTZ
	 +CEO+xlyBVwlF0PjO4h50CeEN0AmTg/ywJYvE3ORWDCC4N76XWz+Kodxf9e33Yphlf
	 BIkeq5dHklcKMcGAggYTMijw=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id B8CAD1E6589; Fri, 19 Dec 2025 12:22:54 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1766118173;
	bh=tQ48w5dtuOe92p0iA3QahLgH9d2IZNXIgByp1F4qGHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S7PGnjA2N2ziI5ub7Id+Gal5qIgJScfEwtSiDTWDHk/zSLH963rD7GMz6IEPee35E
	 /mrz+MQHqr6T2kcMPB5GXWKsvmq/J0antbZkGi6tD6OJLDWUVYS99/2YHQdI0uf0ia
	 1yk6TiV6nq9MdHvLqDv1nsbu4eWLxo0QJVsJtN654k1A0Zff/wX0F8FUA6lYXtjwB4
	 dNo0ZObBvnWQrGjxUd5nnQsGOzSiLZx7BA7MkmdxaxuifoDSgkd+otk8A12gMcjQJd
	 Pm0g2LyzPYT6clVNiR9L/E5k9SAa58fksG3IXxVClv1NUk5v39seXJ4f6K7CPSESRN
	 fLcIbiw/GzR2APt6xJSXQrd0eOaSJf7Bay/eEXTXbYiswT+acIRfQ1dub2493Z1BFT
	 F2ViJ/CDN9WALuU8fM+rm6tPUTNFIXMJfb1pfbRxnsVnvt/UjxCrHhfQcpdWePBg9/
	 0o6WKWQFE1oueItmO1rFA9AYNfoY3cgZQ3pba5p7ULJr48dne9SvNaG4kneT8jF8Cq
	 6MaZdWMab30LAp9BW/tzb6GfrYPV6F8I9d2pq+KNcIm+WNsUUIDGvaMwRirosq7ztN
	 kLL77Dyxu5L/pO4pElC+yFhA4lkbLVhjCVPurk1lX5kGkNS6Z61sjqnjB0XGxbFz0m
	 12Oo6FC9nz7Vt4U0IrUBMN8k=
Received: from [IPV6:2001:8003:8824:9e00::bec] (unknown [IPv6:2001:8003:8824:9e00::bec])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 9577F1E6584;
	Fri, 19 Dec 2025 12:22:53 +0800 (AWST)
Message-ID: <62f352ef-f89e-49b6-9b51-c6e1c3c4f510@davidgow.net>
Date: Fri, 19 Dec 2025 12:22:49 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: ops: fix snd_soc_get_volsw for sx controls
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
Cc: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20251216134938.788625-1-sbinding@opensource.cirrus.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20251216134938.788625-1-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 16/12/2025 à 9:49 PM, Stefan Binding a écrit :
> SX controls are currently broken, since the clamp introduced in
> commit a0ce874cfaaa ("ASoC: ops: improve snd_soc_get_volsw") does not
> handle SX controls, for example where the min value in the clamp is
> greater than the max value in the clamp.
> 
> Add clamp parameter to prevent clamping in SX controls.
> The nature of SX controls mean that it wraps around 0, with a variable
> number of bits, therefore clamping the value becomes complicated and
> prone to error.
> 
> Fixes 35 kunit tests for soc_ops_test_access.
> 
> Fixes: a0ce874cfaaa ("ASoC: ops: improve snd_soc_get_volsw")
> 
> Co-developed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---

Thanks very much: I've just bisected those failures to the same patch, 
so am definitely keen to see this fixed.

Tested-by: David Gow <david@davidgow.net>

Cheers,
-- David
