Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192673;
	b=UJsaRQkJHVQLgfsHVww7Zc1WcoXA+ooHLWFRLIg5b5Vl3kEVU2ka1HJrbhtkt4+NlYaB
	 VbogGdAm6Y7kN6ojTi8mep9fIZhFpWclQN/g3tpKEXLUUPaz2rWzxcNOj98ZoHrLOg6z3
	 vEzvRv4Y1ShnBfKowLZc9PI6KYhLWcpAqaqAkoYJQUHGvd5uC81EfdE7J+D4X1qB4yfcT
	 62Ls2X+s0IVrSXxcII69KPt5nnVETk8pVkS9NEBiOI7oujDhIyh6QDxRhMLVGsY6YnNa6
	 2QaVmWl4Ts7osaKOo6uXwmgivrYpzNvPAU4bs5N/LEf+naczCP3uik++5oCu5a0i+yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192673;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 Thread-Index:Content-Language;
	bh=1LO/2HvoJ2ZyUkkyxgRWIdr3OS240BO3WaHY2vCxOWA=;
	b=qvE/37kPw0lKqs/eRFVlGwUQWj0qrfIYACpkJyc37wp7dIqxTxCPObNSSFpfoBDAukvT
	 aFdeaDQi00d8MxDfHM3aVz4z94phi39NzHjEhcMvHPKK0XPsSDCDH3x3lY6vp5YlS1IFS
	 fzf8aq+rPfkY/IgISTF4a5l59Td2lCjtsLPAAqZ/tT+aXh1jFGuzRGQuSrvhZ31FPZ7sb
	 cHq30hFcQ1Q1DrkLGrxPhyYl41EB2ECtr0mnFz6yDLvAL1e9v4NMy1NSwdrviUrgbAKzj
	 NudNDfgpkb1SXSUw73CMn1ZLWCVs4SGq6JhuIRoRnD9GKVhfK1cg1NgNtDBPxullx2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.82
Received: from r3-82.sinamail.sina.com.cn (r3-82.sinamail.sina.com.cn [202.108.3.82])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8D5606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 02:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD8D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO DESKTOPQJC4P40)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6AF13513000032DD; Mon, 9 Nov 2026 10:51:00 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 056651A0010B447BB50C3E0E4D8E4EEE
X-SMAIL-UIID: 056651A0010B447BB50C3E0E4D8E4EEE-20261109-105100
From: <zhangyi@everest-semi.com>
To: <zuzhenhuang365@gmail.com>,
	"'Mark Brown'" <broonie@kernel.org>,
	"'Liam Girdwood'" <lgirdwood@gmail.com>,
	"'Jaroslav Kysela'" <perex@perex.cz>,
	"'Takashi Iwai'" <tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>,
	"'Mario Limonciello'" <mario.limonciello@amd.com>,
	"'Vijendar Mukunda'" <Vijendar.Mukunda@amd.com>,
	"'Charles Keepax'" <ckeepax@opensource.cirrus.com>
References: <179398129782.44051.2897523393297405157@gmail.com>
In-Reply-To: <179398129782.44051.2897523393297405157@gmail.com>
Subject: Re: [PATCH v2] ASoC: es9356: fix the capture gain dB scale
Date: Mon, 9 Nov 2026 10:51:00 +0800
Message-ID: <20ff01dd6ff5$27b755a0$772600e0$@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad1v9SAVaTa/aTw2SDSkOaBFWG80iA==
Content-Language: zh-cn

> sound/soc/codecs/es9356.c:es9356_sdca_io_init() {
> 	...
> 	regcache_cache_only(es9356->regmap, false);
>=20
> 	if (es9356->first_hw_init) {
> 		regcache_cache_bypass(es9356->regmap, true);
> 	} else {
> 		/* update count of parent 'active' children */
> 		pm_runtime_set_active(&slave->dev);
>=20
> 		ret =3D es9356_register_init(es9356);
> 		if (ret < 0)
> 			return -EINVAL;
> 	}
> 	...
> }
>=20
> If regmap_read(es9356->regmap, ES9356_VERSION, &version) fails in
> es9356_register_init() during es9356_sdw_update_status() ->
> es9356_sdca_io_init(), this early return leaves es9356->regmap with
> cache-only mode disabled while es9356->hw_init and =
es9356->first_hw_init
> remain false, allowing subsequent mixer control accesses to issue =
SoundWire
> bus transactions to an uninitialized device.
>=20
> Should this error path restore regcache_cache_only(es9356->regmap, =
true) and
> return ret instead of masking the error code with -EINVAL?

That makes sense. I will include that in the next version.


