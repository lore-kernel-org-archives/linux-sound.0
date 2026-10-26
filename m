Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005730;
	b=fk03SI8GRMAyYjUKdPRli2b4DZYPB9PhNJpkZjatEei4wLXOftY05QCx9J3uIWya/fJI
	 lSuw2y22da3uA433HA6WgOdAXRb1RN07TND3fw4q5CTu+vYxxOL9joR9MQKYU1af/WYFf
	 SQ4qnCDZ+EdO7ZsWcJcdK12HusD7p9fLikHpkb372FfYxvvLt3DT6lZ3hwumJx6Y0/wyl
	 z4EEbNJfDXJGUZrl5sytGVAPSF4Ktun344ZqEZII1wb18WFqH+M5gdcqJGJrcAjaSC09+
	 BnB+ubOG5n5PXgKvj3p3Zo2Ajq1vsHhP8oRVafyGAyTu9ynWYMkaoLMyB+VTTM7ki8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005730;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1oeKbA9YlDFcMnkbTN4HyoilzLphlVWbVzdspfoDo7I=;
	b=EVey50w8e65fgRBZtIkGJzvv1s/+/f2JIsSpOTelcmc0zIvq7AQ9tDrz/0tuinS+rO1C
	 z6MnpoL5YSaWzDIKfff0BZO12JpSKAU6Qy0QCj0gSpsBE1skTAAB7Hg5R+d8Mwul5q8pg
	 Pe417jm1EtZqrggwRu5ZjURW2EsTl336NllD7YbJDQxA/jyKiee4ov/QtgxO7D8S5x1l6
	 XmNr+i1LBpgGQkRsuCTzqvRmLpYM2x3oZIPomqX/JTzgOhnyPzuiQgEB1MU9Qj0ykZlhz
	 tQVCBUJdZCV4iwGUnCQK/fFko5OsfkXWxxrrYESxDg2c78tvDfvPCDkd7S3dnl4OE8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z91UtBQN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BB3606A31F
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z91UtBQN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3AF1F01825;
	Mon, 26 Oct 2026 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793005730;
	bh=1oeKbA9YlDFcMnkbTN4HyoilzLphlVWbVzdspfoDo7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z91UtBQNTmTK5tjgP6nOgnb4tMUWwzC8sFjFU47YOBEfvZ2zCM6FfEITqj82Yz8rF
	 7WRm0UYGM/nb3vEHtykjiTvW0iMLTfCUZ0YpXBmU5y9zWkoCvLJHoN2BagPNMMhh1Q
	 Twq4O2fO/1HGcuxDOPCEa0rtgMEGmj+tMMFQeyNVNO0rNVO2JU2laa/6xZOyq32TBe
	 VIp9OyI9T30svSKhjggjVrhkMLzmW4zbZe+xBshlE+4UqUR5JUNTJAVjXmZ1BNyEav
	 M/ZeREF5qT+Ze+Y7hoFGwCeChIl4LBkSnyStLSm04/ie0tmt1HpDhDJz8uLoDfZTZa
	 RbqoREU56Ux3w==
Message-ID: <sashiko-outbox-184738@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 02/13] soundwire: amd: return response on IMM status
 cleanup timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261026044507.2310694-3-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
 <20261026044507.2310694-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 09:08:49 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] soundwire: amd: unpolled IMM_RES_VALID clear in amd_sdw_send_cmd_g=
et_resp()
--

commit 3a55a761f23cc08cf1a64f142c04e1aa78cc244d
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

soundwire: amd: return response on IMM status cleanup timeout

This commit changes amd_sdw_send_cmd_get_resp() to log an error, store the
read response, and return 0 when polling for AMD_SDW_IMM_RES_VALID to clear
times out. It relies on the bad-state check at the start of the next
invocation to clear the remaining AMD_SDW_IMM_RES_VALID bit.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index 307cbfdb94422..0b83126b5ce6c 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -285,11 +285,9 @@ static int amd_sdw_send_cmd_get_resp(struct amd_sdw_=
manager *amd_manager, u32 lo
>  	writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
>  	ret =3D readl_poll_timeout(amd_manager->mmio + ACP_SW_IMM_CMD_STS, sts,
>  				 !(sts & AMD_SDW_IMM_RES_VALID), ACP_DELAY_US, AMD_SDW_TIMEOUT);
> -	if (ret) {
> +	if (ret)
>  		dev_err(amd_manager->dev, "SDW%x cmd status retry failed\n",
>  			amd_manager->instance);
> -		return ret;
> -	}
>  	*response =3D ((u64)upper_resp << 32) | lower_resp;
>  	return 0;
>  }

[Severity: High]
When this cleanup poll for !(sts & AMD_SDW_IMM_RES_VALID) times out and
amd_sdw_send_cmd_get_resp() in drivers/soundwire/amd_manager.c returns 0,
can back-to-back commands read stale response data from
ACP_SW_IMM_RESP_UPPER_WORD and ACP_SW_IMM_RESP_LOWER_QWORD?

Callers such as amd_program_scp_addr() and amd_sdw_xfer_msg() issue multiple
commands in sequence:

sdw_transfer()
  do_transfer()
    amd_sdw_xfer_msg()
      amd_prep_msg()
        amd_program_scp_addr()
          amd_sdw_send_cmd_get_resp()
      _amd_sdw_xfer_msg()
        amd_sdw_send_cmd_get_resp()

On the immediate next call to amd_sdw_send_cmd_get_resp(), the bad-state
guard writes AMD_SDW_IMM_RES_VALID to ACP_SW_IMM_CMD_STS without polling for
!(sts & AMD_SDW_IMM_RES_VALID) before issuing the next command and polling
for (sts & AMD_SDW_IMM_RES_VALID):

	if (sts & AMD_SDW_IMM_RES_VALID) {
		dev_err(amd_manager->dev, "SDW%x manager is in bad state\n", amd_manager-=
>instance);
		writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
	}
	writel(upper_data, amd_manager->mmio + ACP_SW_IMM_CMD_UPPER_WORD);
	writel(lower_data, amd_manager->mmio + ACP_SW_IMM_CMD_LOWER_QWORD);

	ret =3D readl_poll_timeout(amd_manager->mmio + ACP_SW_IMM_CMD_STS, sts,
				 (sts & AMD_SDW_IMM_RES_VALID), ACP_DELAY_US, AMD_SDW_TIMEOUT);

Because clearing AMD_SDW_IMM_RES_VALID requires an asynchronous hardware
handshake that already failed to complete within AMD_SDW_TIMEOUT on the
previous command, won't AMD_SDW_IMM_RES_VALID still be set when
readl_poll_timeout() immediately checks (sts & AMD_SDW_IMM_RES_VALID),
causing it to succeed on the stale bit and read the previous command's
response registers? Should the bad-state guard also poll until
!(sts & AMD_SDW_IMM_RES_VALID) before writing the new command words?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026044507.2310=
694-1-Vijendar.Mukunda@amd.com?part=3D2
