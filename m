Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609131;
	b=THLDh3NnVjDXLd/WKw+f/fdKKuvR9MWJAY+qbY6g+adX/iCNIEHAixluwVFlyho5m3G+
	 r4FIU48reAA3P+SKXNgBjuFy4JFC/tqc7tiPdIFNDRKIHN+u1caDaxJ9ddZ29maWuLncK
	 TPYJx2nSh1nAIj87fXFhSTbfJyQgwkM53te+SK9QUgIALbWTiRlmZUjmwj0f3YYbUQOq5
	 VtJ41Bdi4NKeSyy9WAQj5wxVP47rIIY8H3oad5yeh1CwS3uT7rpAXT8KaxuIIXJnCTARL
	 uTFNMmU6kph9BWBzWMpGIeLkylGVj1oC8wdJEBUKzHz++Yy9TtdRyJgaIVImWE0Rd7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609131;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KFHcpvrlWQv1ZcfrvoaNP6S7f/cIuwgUS/8kwT0n4g4=;
	b=BmlREufr5m7pnpj31rGvASHN3ljNoW/cV1kYY2SfTj7usAbGW6V0fnvVaiXtSZ7IN0V+
	 lDsmAaeJlt6zXCIpSePy5FsO8ywOtZ2cPjjiBzJKkMLii+OrsMylV26ErdGcuBo02EvO1
	 Zh0eRsZ+XF44d1uuLSEB7SqyOykFHUzoKyWtD44fsmWPlgdo1R419MJ0PFvrcBIg1F219
	 vkeZj3kAkwnKzjozN2djsYGIl+dnRm+qXkFp3aGh4NHk3uG+SG9rXdk6dgUQkFUusawOg
	 ixA6M+MR2XtBmf9StjA6sKGbTX5/FEaT8DNeOTQV7jOylj4+lt5Ud3JCCHbMxgemwFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MHbFkqqH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F953606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 12:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MHbFkqqH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CDA1F000C6;
	Wed, 25 Nov 2026 12:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795609131;
	bh=KFHcpvrlWQv1ZcfrvoaNP6S7f/cIuwgUS/8kwT0n4g4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MHbFkqqHmiSuiE50nx5xFwnBnSWQji/5eMyuA5YeeulT9vE/3MX5Z9stgbmN2MFZA
	 H5cPojpZYqH1cTE3Br0mS/TwFcOjvb5AhnG/fk/JTfkQJk47GhnX18I3vGToepCBRk
	 Ns3uETTXKBUnLgYJ5nVxmzOZCKttGAgHiPLZoHEufBkTckZt/rnusdTAIVk/JEzQqP
	 nvLElx7rhuwlV6FV1TsUmpU8IOkhUX3t3wYBoJ/0UYpMJESZ3LNup6M+RSsGsnRWL5
	 9yr1jNXw1wN4S4TzyU5+U782X+33SRLmlkQexo329rT2hCp/blt8x/zqKyIF8zdEcu
	 OkvZt/aUGvPOg==
Message-ID: <sashiko-outbox-233349@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] ALSA: hda/cs35l41: rework how firmware requests
 are queued and flushed to prevent races
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Binding" <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125115124.9130-8-sbinding@opensource.cirrus.com>
References: <20261125115124.9130-1-sbinding@opensource.cirrus.com>
 <20261125115124.9130-8-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:18:50 +0000
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
- [Medium] ALSA: hda/cs35l41: DSP left running in cs35l41_hda_unbind()
--

commit a2a79af13f0805a482086a5ad2d46142a6d2a234
Author: Stefan Binding <sbinding@opensource.cirrus.com>

ALSA: hda/cs35l41: rework how firmware requests are queued and flushed to p=
revent races

This commit reworks firmware load scheduling in the CS35L41 HDA driver to
use system_freezable_wq, adds PM notifiers to cancel or re-queue firmware
work around system suspend, and moves control creation outside fw_mutex.

> diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda.c b/sound/hda/codec=
s/side-codecs/cs35l41_hda.c
> index 51ac11270c88f..9a0063ff41590 100644
> --- a/sound/hda/codecs/side-codecs/cs35l41_hda.c
> +++ b/sound/hda/codecs/side-codecs/cs35l41_hda.c

[ ... ]

> @@ -1521,9 +1583,18 @@ static int cs35l41_hda_bind(struct device *dev, st=
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
> @@ -1531,6 +1602,17 @@ static int cs35l41_hda_bind(struct device *dev, st=
ruct device *master, void *mas
>  		 channel_name[cs35l41->hw_cfg.spk_pos],
>  		 cs35l41->cs_dsp.running, cs35l41->speaker_id);
> =20
> +	return 0;
> +err:
> +	memset(comp, 0, sizeof(*comp));
> +	cs35l41_fw_load_cancel_sync(cs35l41);
> +	scoped_guard(mutex, &cs35l41->fw_mutex) {
> +		cs35l41->request_fw_load =3D false;
> +		if (cs35l41->halo_initialized)
> +			cs35l41_shutdown_dsp(cs35l41);
> +	}
> +	cs35l41->codec =3D NULL;
> +
>  	return ret;
>  }
> =20
> @@ -1549,7 +1631,11 @@ static void cs35l41_hda_unbind(struct device *dev,=
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
Should cs35l41_hda_unbind() also shut down the DSP (with the device
runtime-resumed) after cancelling fw_load_work, just like the err path in
cs35l41_hda_bind()?

Clearing cs35l41->request_fw_load without calling cs35l41_shutdown_dsp()
leaves cs35l41->cs_dsp.running set to true.  If the component is unbound
and later rebound without removing the CS35L41 device, cs35l41_hda_bind()
calls cs_dsp_power_up() on an already-running DSP when firmware_autostart
is enabled (leaking duplicate cs_dsp.alg_regions entries), or leaves
cs_dsp.running and request_fw_load out of sync so the next
HDA_GEN_PCM_ACT_CLOSE queues fw_load_work to unload the running firmware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125115124.9130=
-1-sbinding@opensource.cirrus.com?part=3D7
