Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192862;
	b=UqvybLDTD1d95V5LSLPWe9pNe0GedrqV2846T5uTcm1SEZF/9yZf0NfevYGFfdzAedjy
	 55CUFdO5iiTqaFVMROIp/RrXU9brxyGEOf0v5KplAHsJ6uItIoQwJw3RaTrU17KhkJyV6
	 SnDyVg832hXBv7gbFBnRwAYZ+HtdiQSvNpIxkw7elkSgbXvcIk3kctL09qnKTq5oSX4p1
	 cgit4bwRt3iu8sjVC154jwxzWxSsDwDDgrxF6tKqUbrbPx92/uO/mzvnzWPuuh6AB2iJw
	 97mkWluNXeMCyyRGFrTALW+iv8dHW6PyEsNDOTgZT+DY7LQ0n3+fW4kXvJ9Vioe8dNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192862;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OjPGoFJRdi3qmVRMmvzL7U4nnvhNTrtanM8zaXmfRhU=;
	b=MQdSgpFjgS5t+PqqHbcxLA3mKG+FaSwSsgt8o+1nun+xdeUYo1fS9dQPw4PhIQdeO1wF
	 IaoNsH2Qx12HNuHK/cpW6LJu0DDQkFjzOmCzCdQJ+AenYwKrCjixnqqWtjfmvgi/5LzPC
	 nfIT03vnJf9wPFgygwnqC64A4kRcb4sZTgblqRc+cxnI3K/cC49eqp4DR9UcKXBi8GTcU
	 RziGaAWeSr6kUfSeQibZ5AqYFa6CZi9OuvofJMuzoE0c4JIOloVBzbJ3Mr9F3bJjaJJoN
	 U+2Qe+ONnKaBog6OD/yrY7OZf8SLUw8ShMi51xVhyZBVPRYipFdUxyjYhJuO52s4Ncg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lwYrsX7j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB6606A616
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lwYrsX7j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78471F000C4;
	Fri, 20 Nov 2026 16:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795192861;
	bh=OjPGoFJRdi3qmVRMmvzL7U4nnvhNTrtanM8zaXmfRhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lwYrsX7jZJJlqM/XqKPgKL92PjW93W6y1+0S6HZwTVCO6Gdh0ZYiOb3U65JCFIS//
	 SpxnAUmh9+CHEQkmK0MyRS33Fko8WXMspvruSUfJNyM3EC9391cksGomFfeUrFhY/D
	 rhnB1Mauvc7lRuSAzyGjahag+EuphVE03UNy2vUGf5fXVn9C4IDvDI3Xoba86/HGZb
	 QHTxf7EruOFcIeN0PdSPsZjSV5iELcpKifC7jrE3Nj5IAD/rb4/MyaNVQZQGN3/Xqy
	 GDEwoRNshtl83uMU9zoxLWSWD0iyENgnrtmQSJltEp/ea5soalqEgFMJBK6ZsuyhAM
	 dbllRquz9BrnQ==
Message-ID: <sashiko-outbox-225582@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 7/7] ALSA: hda/cs35l41: rework how firmware requests
 are queued and flushed to prevent races
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Binding" <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261120161136.157593-8-sbinding@opensource.cirrus.com>
References: <20261120161136.157593-1-sbinding@opensource.cirrus.com>
 <20261120161136.157593-8-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 16:41:01 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ALSA: hda/cs35l41: DSP left running on cs35l41_hda_bind()
  error and unbind
- [Medium] ALSA: hda/cs35l41: missing DSP shutdown in cs35l41_hda_bind()
  and unbind
--

commit 9729b30d404ee5bf8ccaef4a8856612e54fee87c
Author: Stefan Binding <sbinding@opensource.cirrus.com>

ALSA: hda/cs35l41: rework how firmware requests are queued and flushed to p=
revent races

This commit queues CS35L41 firmware load work on system_freezable_wq, adds
a PM notifier to cancel or re-queue firmware loads across system suspend,
and moves ALSA control creation in cs35l41_hda_bind() outside fw_mutex.

> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codec=
s/side-codecs/cs35l41_hda.c
> index 6f4b2088c5fe6..512b1a0094764 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c

[ ... ]

> @@ -1464,7 +1528,7 @@ static int cs35l41_hda_bind(struct device *dev, str=
uct device *master, void *mas
>  	struct cs35l41_hda *cs35l41 =3D dev_get_drvdata(dev);
>  	struct hda_component_parent *parent =3D master_data;
>  	struct hda_component *comp;
> -	int ret =3D 0;
> +	int ret;
> =20
>  	comp =3D hda_component_from_index(parent, cs35l41->index);
>  	if (!comp)
> @@ -1494,8 +1558,6 @@ static int cs35l41_hda_bind(struct device *dev, str=
uct device *master, void *mas
>  		dev_dbg(cs35l41->dev, "Firmware Autostart is disabled.\n");
>  	}
> =20
> -	ret =3D cs35l41_create_controls(cs35l41);
> -
>  	comp->playback_hook =3D cs35l41_hda_playback_hook;
>  	comp->pre_playback_hook =3D cs35l41_hda_pre_playback_hook;
>  	comp->post_playback_hook =3D cs35l41_hda_post_playback_hook;
> @@ -1510,9 +1572,18 @@ static int cs35l41_hda_bind(struct device *dev, st=
ruct device *master, void *mas
> =20
>  	mutex_unlock(&cs35l41->fw_mutex);
> =20
> +	/* Create the necessary controls, do not create them under fw_mutex */
> +	ret =3D cs35l41_create_controls(cs35l41);
> +	if (ret) {
> +		dev_err(cs35l41->dev, "Failed to create controls: %d\n", ret);
> +		goto err;
> +	}
> +
>  	if (!device_link_add(&cs35l41->codec->core.dev, cs35l41->dev, DL_FLAG_S=
TATELESS))
>  		dev_warn(dev, "Unable to create device link\n");
> =20
> +	register_pm_notifier(&cs35l41->pm_notifier);
> +
>  	dev_info(cs35l41->dev,
>  		 "CS35L41 Bound - SSID: %s, BST: %d, VSPK: %d, CH: %c, FW EN: %d, SPKI=
D: %d\n",
>  		 cs35l41->acpi_subsystem_id, cs35l41->hw_cfg.bst_type,
> @@ -1520,6 +1591,15 @@ static int cs35l41_hda_bind(struct device *dev, st=
ruct device *master, void *mas
>  		 channel_name[cs35l41->hw_cfg.spk_pos],
>  		 cs35l41->cs_dsp.running, cs35l41->speaker_id);
> =20
> +	return 0;
> +err:
> +	memset(comp, 0, sizeof(*comp));
> +	scoped_guard(mutex, &cs35l41->fw_mutex) {
> +		cs35l41->request_fw_load =3D false;
> +	}
> +	cs35l41_fw_load_cancel_sync(cs35l41);
> +	cs35l41->codec =3D NULL;
> +
>  	return ret;
>  }

[Severity: Medium]
Does the err path leave the DSP running when cs35l41_create_controls()
fails?

Earlier in cs35l41_hda_bind(), cs35l41_smart_amp() loads and starts the
DSP synchronously rather than via fw_load_work.  Cancelling fw_load_work
and clearing request_fw_load without calling cs35l41_shutdown_dsp() leaves
cs_dsp.running and cs_dsp.booted set to true while unbound, so a later
bind calls cs_dsp_power_up() on an already running DSP and leaks
cs_dsp.alg_regions.

> @@ -1538,7 +1618,11 @@ static void cs35l41_hda_unbind(struct device *dev,=
 struct device *master, void *
>  		memset(comp, 0, sizeof(*comp));
> =20
>  		cs35l41_remove_controls(cs35l41);
> -		cancel_work_sync(&cs35l41->fw_load_work);
> +		scoped_guard(mutex, &cs35l41->fw_mutex) {
> +			cs35l41->request_fw_load =3D false;
> +		}
> +		unregister_pm_notifier(&cs35l41->pm_notifier);
> +		cs35l41_fw_load_cancel_sync(cs35l41);
>  		cs35l41->codec =3D NULL;
>  	}
>  }

[Severity: Medium]
Should cs35l41_hda_unbind() also shut down the DSP if cs_dsp.running is
true?

Resetting request_fw_load to false without calling cs35l41_shutdown_dsp()
leaves cs_dsp.running true across an unbind/rebind cycle, either causing
cs35l41_hda_bind() to run cs_dsp_power_up() on an active DSP when
firmware_autostart is enabled, or leaving request_fw_load out of sync with
cs_dsp.running so the next HDA_GEN_PCM_ACT_CLOSE unexpectedly unloads the
firmware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120161136.1575=
93-1-sbinding@opensource.cirrus.com?part=3D7
