Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710684;
	b=WNR6V7l6XGMBRgRUKVlt+w9aml+jraDDHaqigo0O5lR5btNFSxOF0ZcAIuZYEzfHnERy
	 e+EP9lAzXmwaNVFBhA0TPUeOeZrry53JDJBQVMa8ncIeRXSAKeqv3BPTOw1q/bR7H0+IZ
	 1Ru1dC6jYdu1FHO5uGbdWe0jfIcNfFGaKpIp+BnpuS2GCmoosU0DQ01/C9cjErJztQ9s6
	 Om6AT3AfYwIN2ucUIDDCpBxVzwVhsBc3j+zn6Nftfmfs7QAcFheeiw/BupWe+6qzLozEb
	 bYPC5+kvVweWrQQebUELCc7lFi49bIU+ZonyUsMAIhyP5r1RvfKjM8LvuBBqBcA2oow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710684;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Y6mwa6JaipxYZmHI1pVYp6bqhfhFFRSWiRYySf+vbvE=;
	b=5rmARhz1lgJVKOa7C1sMppZSjUIEHdgRr/cCfXFEBcXIcZlmc/H2I8AJhwczcY67uJpF
	 7iA/1309hnMwdGJFJO8J9MYjPuOv3y+6bs8MoxGId6MYN2BJtxt6TLOyleK4mboxISdQR
	 fTZgpCtGkHpwtQvTG+1AH1900PDbE9fA7SB57EvGHMsx4MLQvuiBXhYiDzdGKvXkaUEdV
	 JAESpGwQN9UudGOA9ou5W4AA4pSm5kSNN6SEa43iNrFQlhlHLf7uMPi7JCY/6IXWbVdWA
	 scvlBy490qjCnemyERHlG8Duff+gSoeL4sdsHnUiMcKurfBArEkfUg+eZ8sv3jjtCwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWh4xd6u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCC0606A31C;
	Thu, 26 Nov 2026 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DWh4xd6u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DB01F000E1;
	Thu, 26 Nov 2026 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710684;
	bh=Y6mwa6JaipxYZmHI1pVYp6bqhfhFFRSWiRYySf+vbvE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=DWh4xd6ubEnn4fzLORytu8P385JM5+HCk2KLPQs5ErqqUiXwf9nf3PmMGR3IC5rXK
	 BjoBi6R+VIOrG9idFWwsdptjfJG57/q0zwVTFF3qIQyypzMsvj683lXBlpPPA6dvqs
	 OmjDQOw7NCL5OQoiYeRiEEDMUYD9gb0Z5RKksSLRCGGvaA3cQ+c5PGLQGquvWhHsqa
	 /EAMujDDPWHMMdU6KPni3pBfi4X4DSFnhIM8nn3F8JrqBmAhdLx9NA9c3Jrvicko6Q
	 VES+f8/HmcID0ngvbH7nfQZzlE0/Vmgkao0AQ+humBvUV+dTi1K2vZGEVkKyAvMKfu
	 qiQQVSD3wYf/w==
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
Subject: Re: [PATCH] ASoC: hdmi-codec: Clear the parsed ELD on unplug
From: Mark Brown <broonie@kernel.org>
To: Roy <rongh7426@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261126103757.655758-1-rongh7426@gmail.com>
References: <20261126103757.655758-1-rongh7426@gmail.com>
Date: Thu, 26 Nov 2026 16:31:19 +0000
Message-Id: <179571067964.142532.4165076016076340495.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LgnXw2XvaXIyFLlF9cwitJAMbyTGh6SNmDkHMxM2HzQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI54m68XFLJfPWPJkfNv7+75NMdjm25P++vyYMk5imWb
 +rsP6SpdZSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiXjsYGdql9GNuS168oTBx
 j+vP89Gakx5mn8969cpfZ+FUn/8LXmxmZPhkrPLiYOI8hVmeAj/O5l8Q5khvzGbpkj58cvP7SW6
 fAlkB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> When the sink goes away, plugged_cb() clears the raw ELD but leaves
> hcp->eld_parsed as it was. The eld#N procfs file prints eld_parsed, so
> after an unplug it keeps showing the monitor that was last connected
> until something is plugged in again.

> Fixes: 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs")
> Signed-off-by: Roy <rongh7426@gmail.com>

Can you please fill out more of your name, see submitting-patches.rst.

> +++ b/sound/soc/codecs/hdmi-codec.c
> @@ -973,6 +973,7 @@ static void plugged_cb(struct device *dev, bool plugged)
>  	} else {
>  		hdmi_codec_jack_report(hcp, 0);
>  		memset(hcp->eld, 0, sizeof(hcp->eld));
> +		memset(&hcp->eld_parsed, 0, sizeof(hcp->eld_parsed));

We should probably do the update before the notification, otherwise
userspace could get the notification and read the ELD before it's
updated (this is preexisting but the more we're updating the easier it
is to hit the race).

-- 
Mark Brown <broonie@kernel.org>
