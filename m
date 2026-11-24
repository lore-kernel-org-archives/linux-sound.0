Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556430;
	b=1c9U4i2wSTseO5JhIzUNZ269FcrYZFb+l5RGrzPrDtSMTUdwC3HhqV9b+aHX36AP2lNQ
	 9M61XJyliWSufplUgeF4WwC33lm3LWjXiEnUi3Rf0EWllONhBB3ry+QG05bYnyVgYAtdA
	 ipd4yNYIIzNlSyzYoF6aZDj6nCUzLy6G5EzUFzAUTOEnJuXDoa/AMCmyoOWEH/98PGsm8
	 m37hlePRClh/gm/+88w+uyZaZgtX2g2e0IJAzaELyIliiwVWW370FyY7HfEHK+Domin6m
	 4Q/ToU/Hy9GUJ3xgfqdE38rIJGr8B+d6NEr0UPgWGoNyT/6dsKGwEZevahLLFVFVzDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556430;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5kLpCD3qY67ScGAw54lx7HOJGyZAzXg5umYihwKzds0=;
	b=wJY35diTsbtSVygArs0sS6MtB4dagKGMpHLUMEoz6/oX2ZI0/xcp5qi975TI8Eg3vadg
	 jdWI4K9IWXPV711y25xRBhMr2Z9+SBrxsG30Wyepx6pE9GQX2Ji5jQdkWhGIQenF7kIHo
	 sXioZSrPnOFQ4Bz9HAKujjRQG4SA+JtgVwXwjvbZkM8Z5tO1rltxLwPlW6GZV7cMS88LC
	 a484mBUTGwfl7K4LmzFJW3qbhseqjvZUGbsEaj5mr6DC3bAODGioD1EOqI3mQqdVM0zRO
	 2hQXM6j3G99eH6hbX5Et0/Zpq7U99qKb4FrTa3l1z5fYKIxOZte8kszzV3xWwJhyVug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7AmF26x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F115F606A31E;
	Tue, 24 Nov 2026 21:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E7AmF26x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEF71F000C6;
	Tue, 24 Nov 2026 21:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795556429;
	bh=5kLpCD3qY67ScGAw54lx7HOJGyZAzXg5umYihwKzds0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E7AmF26xKYLIo8lkn343eYNC/BcJ1mTFmdkWVVs9NuSVWD1T88BUDLXMDKXpg3lUv
	 +4gdRD1EX5w2iUnCQYlFvgWiWIU9muxKEk3c5GXDiRSpBmgy7FOw5jMXPCac+yGZXT
	 lwSthXGt2OoXbx8Qokg+RpQWEmLjIk5zG4AiXnqLeDl8BS4QHTL20PKksd4dHzQLRw
	 qWt07qrle5mVa9S1jnYWpGKR8vlFxow9eW1bm2yz22JKjdPHg7xGOoFXoCMU3d8xPf
	 P1jBKhXxmODrTSCqDtlNhp+mmanBYrvY3r0EntLEPJwjTAUOgFx4cvE0xcgR/BjPZR
	 fNBLXSdXRI7NQ==
Message-ID: <460a60f1-34a4-4c6a-977c-3e1c6543f8fc@kernel.org>
Date: Tue, 24 Nov 2026 21:40:27 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: return port disconnect errors from stream
 unprepare
To: Avi Weiss <thnkslprpt@gmail.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029125631.1551141-2-thnkslprpt@gmail.com>
From: Srinivas Kandagatla <srini@kernel.org>
Content-Language: en-US
In-Reply-To: <20261029125631.1551141-2-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/29/26 12:56 PM, Avi Weiss wrote:
> slim_stream_unprepare() ignores errors from slim_disconnect_port()
> and returns success even when a port disconnect transaction fails.
> 
> Continue attempting to disconnect all ports, but return the first
> error to the caller. Keep freeing the port array after the attempts
> so a failed disconnect does not prevent a subsequent stream prepare.
> 
> Fixes: abb9c9b8b51b ("slimbus: stream: add stream support")

cc stable is missing


> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
> Changes in v2:
> - limit the fix to reporting the first disconnect error (still attempt
>   every port and always release the port array)
> - dropped v1's retained port state, selective retry, and stream_free()
>   change to avoid blocking re-prepare in existing codec callers
> 
> A complete recovery solution would also require the codec callers to
> handle disconnect failures and coordinate hardware state, retries, and
> stream lifetime across stop/start cycles. That broader work is left for
> future submissions - this revision fixes error reporting without changing
> stream cleanup semantics.
> 
> v1: https://lore.kernel.org/r/20261028145508.1111792-2-thnkslprpt@gmail.com
> 
>  drivers/slimbus/stream.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index b4e70a7edd1cc..220e22088f8f6 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -448,19 +448,22 @@ EXPORT_SYMBOL_GPL(slim_stream_disable);
>   */
>  int slim_stream_unprepare(struct slim_stream_runtime *stream)
>  {
> -	int i;
> +	int ret = 0, err, i;
>  
>  	if (!stream->ports || !stream->num_ports)
>  		return -EINVAL;
>  
> -	for (i = 0; i < stream->num_ports; i++)
> -		slim_disconnect_port(stream, &stream->ports[i]);
> +	for (i = 0; i < stream->num_ports; i++) {
> +		err = slim_disconnect_port(stream, &stream->ports[i]);
> +		if (err && !ret)
> +			ret = err;
> +	}
>  
>  	kfree(stream->ports);
>  	stream->ports = NULL;
>  	stream->num_ports = 0;
>  
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(slim_stream_unprepare);
>  
> 
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d

