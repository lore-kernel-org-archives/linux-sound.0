Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CB51F3BA4
	for <linux-sound@vger.kernel.org>; Sat, 16 May 2026 06:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778912429; cv=none; b=NlUnZJqySImfcCZXr5b+Tmciz6IEdhUU3KhnGr0+fTB0nFjtSUE+2bg6MNoP6KHzMjtU3HxOOUddeaHp5ob8Iptm36kh8bJoUDoHjZeGKUuMX8B5504rsgjxGsMSRygxkJis8ngXYy2SbB05BSZrJwWuf6BdsRJolCGHPEuQTos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778912429; c=relaxed/simple;
	bh=7PTODfnF4jDteFIS1B1CiL9RVSWqvR65lQqW2IWikZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNuxnRkslbpcQpGM8hsPnphMx3rQ+nm92GGN9wBVDksw7VeIzL1e/oFdQJnKqJcGPJOxVcefcM8JtIld/ftglCWxGeHN5kTwFmUSWyIdqGW8zpi8p7dfGQLdOcfB7B62I6wbc79jt4QJx7rg9WjIilVVw4dV1IwAeKt6v4uLDCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=x71BcXfL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="x71BcXfL"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-441209fb77eso207251f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 23:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778912426; x=1779517226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iwTg4sm4cNnVhMg5s/1uHcLhMcdNPNXew85SDkoB75M=;
        b=x71BcXfLqscEzjig5Y8vN9FBuiIyLnM3+ZevQtYXAfSnf11FhNPr2ypPuegkp2pnM3
         YqF3z6Fu67qvBqLUKQV47ERa5obkBH0ylMxsPdF92aGZhPxxMNnANlsC0xN7WxUO4Krd
         JAfy4E87bcb3YYLZd+Fj8NyF9ZnsGvqW/o3MWj4OSKEjbiykZ8R8q3kYhNxOGiPoBSQu
         LNB47ZScsi1EAXJAtHYO8U7TRM2ExcW0UNWOXhZFDkDwiA5fL08e6kRYQjPRguGa5JSB
         e9NkdW7rIrf8j4StanzrctHCSvkNe+czedbz2H0AwrZSm6O+z0zjPmlMaGeycn87w8oG
         60ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778912426; x=1779517226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwTg4sm4cNnVhMg5s/1uHcLhMcdNPNXew85SDkoB75M=;
        b=clZFJw8ynkTk8uLN6ksPSUZeHB7cQ60TbV4wD+Lu4jyXilxZyfR2Dr/7YdeqBB0JKO
         rOiNX3tLn4ZQwiJv6Rt1YJgqZAwZTatAWccnBVZ35ZnsULgKl8RXHo1bpk3yIkL2SQEF
         JhCmmSQy0BzhNPExaLvfdpjQcnYcU3M825cEdWip0D/m77QeljEcWYjO6IrzMaDGILqL
         EUMbnsclyuba7dnCMP2FoK4X3SY2OVoKTJMgKUwaAU/Ao9gvuRyoX/flWE2OnUb25DWx
         v4yXMyceGfjeGs37Kbgqk1VKMerookQz4vPqr1RRHqeBdcSlyBiSbRwTKjmluiApUVZo
         BC/A==
X-Forwarded-Encrypted: i=1; AFNElJ9P7T5GZ9A0piuIzYIZ0LOYZJQNWwG2ZI3OeTPdI5j9ZbycSAluDsEq6wGbKBB8Q1Zz1C17H3MZZXywmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIgsC+g5+7rOweFboBFFriKMB1jqeecs4xfRxsa/2r26LB7qI
	g36DgLqc7ZaHn1cyA/U2/dVzpwikoyYgIAPuxdLey9VCzGlsscMnJWPLDeIHgdXJTO4=
X-Gm-Gg: Acq92OHgpgiFyHOPojAK8gj6Ygjx2UUMIM8xlyfh9sEbSGEjQRTVO4iBa4DZnwUOopw
	vtglUEMy0FlhfGghsrFO1b8S/1lV6NtYDfIn2hp9v7HW+BNQvlKwmMqb/DUvtfv+3EE4qo2hhYz
	kqDqnS2c4nbn1WfofrdAfc8H+tlezezElRGfIRMNCK2fnT+9OPDoCh7UCcVDOcB84ozfMysnFwN
	yGNIEmgMPjIZmXkOzmX5I4SbU8BTN3pwmZqdZYtb82hAcRcqw87XqYv/pdRoLQEu7eRDAQZon2A
	KQqG+BvbsOkbcRar6tRZq6L2xV5erWMvt+l2bcjzLWW75c6myHBio0DseuUx2dl5wMi6b1JRFx3
	t+ok2LcfWaFB7kVX3u8ISfRZmx6i7ODHXtL2MmgLoEJVh5831ciBqnT6AFaYpxGQfqeY4lVsCn4
	dXBp4Xp/iql6+yAVuvT56dJoqlBJNXyQDddWy7VcM=
X-Received: by 2002:a05:6000:248a:b0:451:259d:83fc with SMTP id ffacd0b85a97d-45e5b886085mr10629272f8f.17.1778912425850;
        Fri, 15 May 2026 23:20:25 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9e767d16sm20858858f8f.6.2026.05.15.23.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 23:20:25 -0700 (PDT)
Date: Sat, 16 May 2026 08:20:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, 
	Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, Peter Rosin <peda@axentia.se>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>, 
	Kevin Cernekee <cernekee@chromium.org>, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan <macromorgan@hotmail.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Marco Crivellari <marco.crivellari@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Aaron Kling <webgeek1234@gmail.com>, 
	Teguh Sobirin <teguh@sobir.in>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, Hsieh Hung-En <hungen3108@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Shimrra Shai <shimrrashai@gmail.com>, 
	Zhang Yi <zhangyi@everest-semi.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Qasim Ijaz <qasdev00@gmail.com>, 
	Sharique Mohammad <sharq0406@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, Neo Chang <YLCHANG2@nuvoton.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Kees Cook <kees@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
	Tim Bird <tim.bird@sony.com>, Bram Vlerick <bram.vlerick@openpixelsystems.org>, 
	Peter Korsgaard <peter@korsgaard.com>, Linus Walleij <linusw@kernel.org>, 
	Wenyuan Li <2063309626@qq.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
	Xichao Zhao <zhao.xichao@vivo.com>, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v1 2/2] ASoC: Use named initializers for arrays of
 i2c_device_data
Message-ID: <aggL5R0PQq9AtpaZ@monoceros>
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
 <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdeitipt6peg3e5c"
Content-Disposition: inline
In-Reply-To: <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>


--qdeitipt6peg3e5c
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/2] ASoC: Use named initializers for arrays of
 i2c_device_data
MIME-Version: 1.0

Hello,

On Wed, May 13, 2026 at 07:23:04PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
> index 9f40ca4b60d5..df438baf05dc 100644
> --- a/sound/soc/codecs/max98088.c
> +++ b/sound/soc/codecs/max98088.c
> @@ -1722,8 +1722,8 @@ static const struct snd_soc_component_driver soc_co=
mponent_dev_max98088 =3D {
>  };
> =20
>  static const struct i2c_device_id max98088_i2c_id[] =3D {
> -       { "max98088", MAX98088 },
> -       { "max98089", MAX98089 },
> +       { .name =3D "max98088", .driver_data =3D MAX98088 },
> +       { .name =3D "max98089", .driver_data =3D MAX98089 },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, max98088_i2c_id);

The indention is wrong here and uses spaces instead of tabs (with and
without my patch). I squashed a change to tabs into my local commit, so
this will be addressed in a v2 if it comes to that.

However we have:

	uwe@monoceros:~/gsrc/linux$ grep '^      ' sound/soc/codecs/max98088.c | w=
c -l
	911
	uwe@monoceros:~/gsrc/linux$ wc -l sound/soc/codecs/max98088.c
	1780 sound/soc/codecs/max98088.c

so it is probably more sensible to address all these lines in a separate
patch.

Best regards
Uwe

--qdeitipt6peg3e5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoIDKUACgkQj4D7WH0S
/k7gSwf+LrTVzNblQTOa3gnZeorGIhj/sMcspAYhIUmYPDtnfBoWNBdCLZc6K4FS
R01MPMG067BmfqLJWRVfIPvDrqvTXZEdQbCLfjh0uwXLX6ljzIR6zyhUCXgUcWQ3
u+eHDUCfsppDqVWerbYOIvYuWjiwHKUnrwRhAEzSVdM8thodBh2uJA16VChPQQP6
MjmDYEtytpJ0azMDrGVj0bVo026970Cd6YS4CKLe5vtZxIIqe+Pcl9kto1IPib6V
4A/u+r7xWwgcgwFWAsFDp+hXP7cWWZ4UWr+5K5Yryn1oUh0dRs3OEtG3GVOoDzD4
9is+wvNpU2YideeLn4AUYPLz3Mqh2Q==
=EDAl
-----END PGP SIGNATURE-----

--qdeitipt6peg3e5c--
