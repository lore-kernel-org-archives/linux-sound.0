Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067488;
	b=T0c6wCjoNXO32vGXj4fxAC8aEiYc6GcnLTwEyWKYy6+rcxejZW8G0XfTkwh3XzkE/CFY
	 GS8RNLUo86nV23EooO5uiPsAGPWGTwyRiNnH0FvhwwsnItTQ8aP489S9Saav+7hhNmmhH
	 IUqc+OmuB1XEhzY1tvbMJ+7nOqth0G1gwLX/txFdjRdnLh0nokvrkAR6kkJ0BgJg96Nuy
	 cpJTBuV3rJvCgO4zRQd9KWXz1jF8AliyRYpQIe1oGVQWu7bJjB8IbQYOQI7yGf7e/IorN
	 0bQOj6uCH2N6unG55jnYDbI+3ZFUcqWUA7zwH4UdaHB/6TqPtI3Jl8ufTSPnTU/sy9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067488;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fFUWjcpzrTkZXjzCQOqjTlJ2t/XawHxTIPLIXJg4i9I=;
	b=h+SQro7ZOg0dQ1n5o/oBDxzSBPaU8HRoddZOuPCqZihWc1pNf+K9/ZqHsEdSXtBqJAGj
	 UZnRBfVDNWTYO1hUnfQkqz3o+C1nP1iTPaqYirMScGqP0Zui4GArF1mvUweCzOX5CbzId
	 K6JXl5YftsxUh9mRj5q10A1XdtfvqY4Bb+1xopASKcyuEZLnIleUbYPCjVGHlaUt0jNrM
	 Hgl+Adv2Gyf1usu/bEsXtuaeUWUCBPdimFF7kc6FCYsbLYNxvC+X2GBM71L2bsSEq29Zx
	 4FQX+9lz6M7Hwt1Lwtv8rvEToA2qnn7Il5abfhEVUOOHnIW0ajlFWKtM7mBPjnP0uHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i0vK+ipT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B3606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 16:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i0vK+ipT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D471F008A1;
	Sat,  7 Nov 2026 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794067487;
	bh=fFUWjcpzrTkZXjzCQOqjTlJ2t/XawHxTIPLIXJg4i9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i0vK+ipTzBDY2gt3L6vNwyWwupsVsVCKFhog1GweWTvwpN2OyXWHvPFJHIEiWT/qN
	 6ZSh1eBDQxIZAW3J7so0/c8azy9jj4Lz3ZPw10Gw6NX9CKhn9iO+OgCp8SqaYNeLEI
	 wzSdN+XUA7v8Z4FoqWVQVVJ/ReZEn3iUjClvZ79D4j+7pM8MdG9DftMRBFK8LXSWbk
	 XYLpbt6xumMsdVuuty3q1LWzM7pt8ku0wukPcUXKVOaPWeSapiHcbRKchN+9zQqa6U
	 lDZbaDPHttTl0TGGAq3tLEk0Ly1RHbyg3yX4xonhG35jnknb3XcfeQPaV9bf0JQprj
	 JM2NuwD1WNUDQ==
Message-ID: <sashiko-outbox-203016@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/25] soundwire: amd: return response on IMM status
 cleanup timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107154659.3358223-11-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
 <20261107154659.3358223-11-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 16:04:47 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] soundwire: amd: unpolled IMM_RES_VALID clear in
  amd_sdw_send_cmd_get_resp()
--

commit 89df36f0150dc3c96912a2aa097eb2d1d5dc0e6d
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: return response on IMM status cleanup timeout

This commit changes amd_sdw_send_cmd_get_resp() to log a warning, write
*response, and return 0 when polling for AMD_SDW_IMM_RES_VALID to clear
times out after reading the response registers.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index f2ed0490aa82d..579b12946c0ca 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -384,9 +384,12 @@ static int amd_sdw_send_cmd_get_resp(struct amd_sdw_=
manager *amd_manager, u32 lo
>  	ret =3D readl_poll_timeout(amd_manager->mmio + ACP_SW_IMM_CMD_STS, sts,
>  				 !(sts & AMD_SDW_IMM_RES_VALID), ACP_DELAY_US, AMD_SDW_TIMEOUT);
>  	if (ret) {
> -		dev_err(amd_manager->dev, "SDW%x cmd status retry failed\n",
> -			amd_manager->instance);
> -		return ret;
> +		/* Response already latched above; timeout here is non-fatal.
> +		 * The residual IMM_RES_VALID bit will be cleared by the bad-state
> +		 * guard on the next invocation, provided IMM_CMD_BUSY is not also stu=
ck.
> +		 */
> +		dev_warn(amd_manager->dev, "SDW%x cmd status retry failed\n",
> +			 amd_manager->instance);
>  	}
>  	*response =3D ((u64)upper_resp << 32) | lower_resp;
>  	return 0;

[Severity: High]
Can returning 0 when AMD_SDW_IMM_RES_VALID fails to clear cause the next
command to read stale response registers from ACP_SW_IMM_RESP_UPPER_WORD
and ACP_SW_IMM_RESP_LOWER_QWORD?

When a caller such as amd_sdw_xfer_msg() issues back-to-back commands, the
next call to amd_sdw_send_cmd_get_resp() hits the bad-state guard, which
writes AMD_SDW_IMM_RES_VALID without polling for it to clear before
issuing the new command and polling for (sts & AMD_SDW_IMM_RES_VALID):

drivers/soundwire/amd_manager.c:amd_sdw_send_cmd_get_resp() {
    ...
	if (sts & AMD_SDW_IMM_RES_VALID) {
		dev_err(amd_manager->dev, "SDW%x manager is in bad state\n", amd_manager-=
>instance);
		writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
	}
	writel(upper_data, amd_manager->mmio + ACP_SW_IMM_CMD_UPPER_WORD);
	writel(lower_data, amd_manager->mmio + ACP_SW_IMM_CMD_LOWER_QWORD);

	ret =3D readl_poll_timeout(amd_manager->mmio + ACP_SW_IMM_CMD_STS, sts,
				 (sts & AMD_SDW_IMM_RES_VALID), ACP_DELAY_US, AMD_SDW_TIMEOUT);
    ...
}

Because readl_poll_timeout() reads ACP_SW_IMM_CMD_STS immediately before
sleeping and the clear handshake is asynchronous, the residual
AMD_SDW_IMM_RES_VALID bit can still be set on the first read, causing
amd_sdw_send_cmd_get_resp() to return the previous command's response
before the new SoundWire frame finishes on the bus.  Follow-up commit
"soundwire: amd: clarify bad-state guard poll omission in IMM_RES_VALID
path" documents the missing poll in the bad-state guard, but does not
prevent the subsequent response poll from matching the un-cleared bit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107154659.3358=
223-1-Vijendar.Mukunda@amd.com?part=3D10
