Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362526;
	b=BIjOWJlM/F8aB0JZKh9PbFFXmkX39kEtNvp+gZHAQ2UIxkOtqG6FjtlJMD9UPIsjAHDX
	 r5LsY/9pW+VrYXFirB7VAFI+YPZFuALLiEGuYlGzh+20XTQGFTdssd3FkE0NUFMkwvRyk
	 wD1Nsf+qkavanAqI1Uy3PNJBKt8vfRGtLueOQBoIH3SMuWtJ385XfGutQgbwTjEf36FiF
	 SlOhe8c8xOe/uVi7HasECI4d51a3djBJfrV8DEJEO7NEoA6Yqq8oIdALVTAC1mW0I0lmq
	 6TDBhBO6v36O94JP1cND73NYfG2SFs7KWOV8TwW8qjUY1uATWqQqP5ODuYkbtf6RBqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362526;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=toWs2RFbrAPghWRQl3hasxXAYk4waHWBsoVnPxq4G+w=;
	b=koQN5qT2L+FABwQkKI+HrR1/Y3lZoNheP8RmdMfvyFpVcBC3FmpYmuobtXKo4xoCuNoW
	 0Cs/xcLnb/LtGR1UzoBD97+oDFJQ44dBJuc9UipbkbPSRsy1jy5b4+3/bXEh3IOFs8d2i
	 poyHmbRBIZhWW5OC/GQUVyJ12fKuyCFMAGSQG2XWvsP6fdiXRIr2GKW6ZwbwwpgGAD5+n
	 gzZ1ZgcO4+h+MxZLJ/eAs8bK+EJpJ5atZ3Z+Src4DD9SwbchymZmIesRiy2TkZT6UDx27
	 +Hn3V+WJSEdz1oHb80/QL+C61VdayDSr8+YSqhT5iJaePaYpNBwLUoxtmQXuN/iKBxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OWpBCBhn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7798E606A31C
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OWpBCBhn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35781F0093A;
	Fri, 30 Oct 2026 12:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793362526;
	bh=toWs2RFbrAPghWRQl3hasxXAYk4waHWBsoVnPxq4G+w=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=OWpBCBhnnm6lpMmhCQTljd8IOiveZTiao4yQGjXpQgmP5TErfs+2GvU3DNUdFaxMH
	 QcXBeMfSKcs1S4WvfQlRrS3DiK4JmifnclmLAruA0Xe6ybe5xb2gUa9LpRv9g4VLYa
	 UEGgFcnTXAyGlI1hNdOqEgjSiZUUKcTJexdStE/Z4wUvJt0wULu+s5jMSpXaC08TkA
	 ahOhnGKkCI3wBkkaVahy94zi29cEWw8SBF4sHZ8lM8hX30bGL1XBq4VN31W+GlGH+A
	 k9NILGcqRwXIQBxU2KIyYeOEslbibNIZM/uyDqsYO3w+S+XvTNlH9ICj/trnzE6K1W
	 tHewps4wmOP9w==
Message-ID: <sashiko-outbox-191004@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/21] soundwire: amd: Check ping command response for
 timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, linux-sound@vger.kernel.org
In-Reply-To: <20261030104840.3361217-14-lee@kernel.org>
References: <20261030104840.3361217-1-lee@kernel.org>
 <20261030104840.3361217-14-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 12:15:25 +0000
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
- [Medium] soundwire: amd: stale status[] processed on ping timeout
--

commit 390668deca85bb859cd47cec7a3a11161bb84e4d
Author: Lee Jones <lee@kernel.org>

soundwire: amd: Check ping command response for timeout

This commit adds checks for -ETIMEDOUT after calling
amd_sdw_send_cmd_get_resp() in amd_sdw_read_and_process_ping_status() and
amd_sdw_read_ping_status() so that a timeout error code is not decoded as
peripheral status bits.

> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_mana=
ger.c
> index a3316efdf8ac2..a8220235a2ae3 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -448,6 +448,8 @@ static void amd_sdw_read_and_process_ping_status(stru=
ct amd_sdw_manager *amd_man
>  	mutex_lock(&amd_manager->bus.msg_lock);
>  	response =3D amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
>  	mutex_unlock(&amd_manager->bus.msg_lock);
> +	if (response =3D=3D -ETIMEDOUT)
> +		return;

[Severity: Medium]
When amd_sdw_send_cmd_get_resp() times out here, returning early without
propagating an error leaves amd_manager->status[] containing stale status
values while callers proceed as if the status array was refreshed.

In drivers/soundwire/amd_manager.c, amd_sdw_update_slave_status_work()
relies on amd_sdw_read_and_process_ping_status() to overwrite
amd_manager->status[] before jumping back to update_status:

	if (amd_manager->status[0] =3D=3D SDW_SLAVE_ATTACHED) {
		if (retry_count++ < SDW_MAX_DEVICES) {
			writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
			       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
			writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
			       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
			amd_sdw_read_and_process_ping_status(amd_manager);
			goto update_status;
		}
		...
	}

Because sdw_handle_slave_status() only reads amd_manager->status[] and
does not clear status[0], a ping timeout leaves status[0] set to
SDW_SLAVE_ATTACHED (along with any other stale entries in status[]),
causing the loop to repeatedly call sdw_handle_slave_status() with stale
peripheral status up to SDW_MAX_DEVICES times.

Similarly, in amd_sdw_irq_thread():

	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
		amd_sdw_read_and_process_ping_status(amd_manager);
	} else {
		/* Check for the updated status on peripheral device */
		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, amd_=
manager);
	}
	if (status_change_8to11 || status_change_0to7)
		schedule_work(&amd_manager->amd_sdw_work);

If the ping command times out when handling AMD_SDW_PREQ_INTR_STAT,
amd_sdw_work is still scheduled and will process stale status values left
in amd_manager->status[] from a previous interrupt.

Should amd_sdw_read_and_process_ping_status() return an error code so that
its callers can avoid reprocessing stale amd_manager->status[] entries on
timeout?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030104840.3361=
217-1-lee@kernel.org?part=3D13
