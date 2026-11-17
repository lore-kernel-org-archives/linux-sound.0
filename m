Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957466;
	b=v09L5c2Yo0zJcfyVbjW8Tcw4ZtEzNEYKUW0dqFHZjc9GvrGXr2yP6AD5PPwi7hinID+3
	 U0ePACMwobuJdR90LWAWeCdJR7jKoWaPcs+iZ6aLy2mrtVfd1+CljfqMCHC1ng1O9W6u7
	 fGghp3rn2MmbxvhEo0Wgifrh3XGCSKeBjnzPPQeJc8kkAJDmCm3aVCHrzAZRIZHEUO22n
	 bPYrX4tiSF7TRNZ+dTXwG5x7DdOL/jtZ2dX+mcccrJSCctl0o4EsmVA/I54qX+YLGJPSo
	 O2YalacuqaVPGB7CyzB6Ou+UQMO6HHzw6GSb8cuV+I/MTLo/xASdOhFgmblZL74QoVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957466;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=glRxYCcN3SAkjrdd4zWA5HRb107KHbueK2xhJQ3L+xg=;
	b=qxv8UmYhma6MVg75NXDVD6mR6D05C6/0b7eT53hQP9mzmGHD169Oe5tIvEAq5Ro9IVXU
	 sJQDQMQfURh3zpfh89jKXJn6WoNDlZlSfj4jVqiEsoBNTv4OtXQV7YJ0+S6t4fdltMC+j
	 ndbr4H5DZYiZKmMH3iJVHQVSXzor+z9GZ880GGOKNRhtePptEpAhGCTmc441H8dQlQwZA
	 Q5+oSOqTs4eFYq93U0dFNbGU16plKDOa7BZhtYm2BLU7SNoK4n1/PimnI70/pKI5116di
	 2zAKLrasbVhjhwJL0wa9pVwzfGnJCFath7H5gUfyQ+41+7q0rBHPYAmtlRUYUizxWDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3peEo4W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98951606A31C;
	Tue, 17 Nov 2026 23:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3peEo4W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3471F000C4;
	Tue, 17 Nov 2026 23:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794957466;
	bh=glRxYCcN3SAkjrdd4zWA5HRb107KHbueK2xhJQ3L+xg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=F3peEo4WgXuV5hQ1+AKe2G7VGXbN7ELA81lbQV5I4kSHJBJuhdgXHHqXd+hQCgi8Z
	 Pdj9Yk5spwvTunIRypexbvmoGarJ1UZYfEi+z9fdEEU0CjFeZpdoSWGH5t5V8FkIjp
	 b40S9EldAaFQkW+/6HMJVciKRDq7Pn36cJYHVT6Pb6CnS4SjeDAHq7Id/52M3Oy0x3
	 xAp5zrthdQwTAwnZaKMFtJFD+PeP76X1nK2xCmiFQOvqIEtx30pu8HPYCdfEh03g39
	 SKzQR6tQKvG8CtT2MflPCeuFDQEaJBAwFdVkcQxOL2h3kWr7PW6nWdCWa6EPb3NCab
	 n+SdhrjHahXrw==
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/4] ASoC: SOF: report volume changes in mixer steps
From: Mark Brown <broonie@kernel.org>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261117105953.188645-4-kapoorarnav43@gmail.com>
References: <20261117105953.188645-1-kapoorarnav43@gmail.com>
 <20261117105953.188645-4-kapoorarnav43@gmail.com>
Date: Tue, 17 Nov 2026 23:17:38 +0000
Message-Id: <179495745842.2707353.6764300085755200722.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b0C4iU9LsFLLVskI9/JhFzqXZEfIgZbhQ6JydxsTHHI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+PJj2Y3XH87eHm57VL9/b/fAbg6CfmvgjFs7pGoqmP
 zM+qyqpdJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiAUcZGS6lTWKxEXsksdvx
 y3e7E9rP9R99DF/jH+TjOPe3DPuz42EM/+PttywSc9KTO3bn2gfXpZ2xEW1bjsvsa8kUPSV5efX
 cd/wA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The IPC3 and IPC4 volume_put() ops decide whether the control changed by
> comparing the new linear gain from the volume table with the stored one.
> The stored gain does not always come from the table: topology loading
> initialises it to 0 dB (VOL_ZERO_DB or SOF_IPC4_VOL_ZERO_DB), and
> volume_get() reports that as the first table entry at or above it, which
> is usually not exactly 0 dB. Writing back the value that was just read
> then changes the stored gain, so put() returns true and user space gets
> a change notification although the control value is the same.

> @@ -180,10 +180,12 @@ static bool sof_ipc3_volume_put(struct snd_sof_control *scontrol,
>  
>  	/* update each channel */
>  	for (i = 0; i < channels; i++) {
> +		u32 old = ipc_to_mixer(cdata->chanv[i].value,
> +				       scontrol->volume_table, scontrol->max + 1);
>  		u32 value = mixer_to_ipc(ucontrol->value.integer.value[i],
>  					 scontrol->volume_table, scontrol->max + 1);
>  
> -		change = change || (value != cdata->chanv[i].value);
> +		change = change || (ucontrol->value.integer.value[i] != old);

You need to compare ipc_to_mixer(), there can be duplicated steps.

-- 
Mark Brown <broonie@kernel.org>
