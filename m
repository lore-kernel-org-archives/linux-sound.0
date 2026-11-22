Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364919;
	b=UbGtNiB5hy7+FJWubL8SsGaUF+y/4mfkGy6EfLhPc82HU9XJIb113vH3yblg9xfMSCLQ
	 Mu2h5NYlcxv1drY9umOQ9GKd1Aynx9OAqIwgfNrprXuWie6+SmyGKchZYtzkaBvPk+bA0
	 SNq0LVp2Qo+gaULZ/pzkyUucAwDnS7UsAPo3J+3isz3wPxk6lLCwvyDJJ9fmr3mATmcwK
	 le6yfNqE30BJGJRavw4SwtvRQ67ZgNVxEGeeM9DH5e71hVlqubYWGsqZg0rH51/LIw6JE
	 bwP4/KthTu1aBiyRkgeVhnwKWRjz4LIr8loeGU28fqCldRxFeKmsAtrKJapU5aqlVWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364919;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K5hfBAfQ+TfDFM334Dt7XFEzRdHF6M3MPfU3cdw3+ZA=;
	b=QSsMa2orJcFhCoUvk37cJ1VND67Vn55fOsCmGIn7WIVI4nyACS9hzCqHBNiMCHN2dIHi
	 0DZjggvrPljEr7r0K8M+pNnwisGHciA4TI8e4CQW5IXkQ+R8KJ+eMjjcy7kJIAL2BDYbb
	 bK5tlCJevJe/3Oaqx2bt/3b4tldAG8xwt1j0OQCNe/hyMt8/XiQ8XFFnbbp6eZfJQCaRf
	 svQLuOLFBXj/yeX7Sa4iCtKWfFQPSPPChbCBjCahVvyccIIQhuSJKNGkW3/i4MZowwYnB
	 cXNAbZLGKXwxZpiMAXBlmBEXMDcdejwC+0QWNux2gpCs1d78uGY51FtQG50ZJMRFb/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QhNtODL9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85969606A32A;
	Sun, 22 Nov 2026 16:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QhNtODL9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AFDF1F000CF;
	Sun, 22 Nov 2026 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795364918;
	bh=K5hfBAfQ+TfDFM334Dt7XFEzRdHF6M3MPfU3cdw3+ZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QhNtODL98eH1jY6+2L2AXID/zbytPugT0oqA1fCsSEbEIe/EMC55L9aWpwaTJiYu+
	 jHSES0GcsSlVdBxFk24WA+/n6E9lVQStNYkJd0iyievTM8FYICdI85F0OmjqjPyc1T
	 R4nsA+si5UJlrfakutqlx87VCQofdUmiGQoSA3agmOAIeMNixSs8h1fRwH/XpRkqxx
	 ppmR7V4kuZuyIsV5Hk+m6dhRQvdh7MPxTZNZLJ+wm+98V2vA168buBPgPPfDSrUA7Q
	 z/hiMZKfiEtpBksPBf2ZPyEVz0pr0EgB81pJIYFH/6EI38380buq3O/lFEr7qOxIPG
	 BgWu3+9tVPgyw==
Message-ID: <sashiko-outbox-228100@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/24] ASoC: codecs: wsa884x: register the die
 temperature as a thermal zone
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-9-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-9-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:28:38 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] ASoC: codecs: wsa884x: const ops mismatch in wsa884x_probe()
  when THERMAL=3Dn
- [Medium] ASoC: codecs: wsa884x: duplicate hwmon device registered in
  wsa884x_probe()
- [Medium] ASoC: codecs: wsa884x: missing hw_init check in
  wsa884x_get_temp()
- [Low] ASoC: codecs: wsa884x: 0 degC cache sentinel collision in
  wsa884x_get_temp()
--

commit 504ad1ac146d2450131667d4fbd39ad8f105450a
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: codecs: wsa884x: register the die temperature as a thermal zone

This commit registers a tripless thermal zone for the WSA884x codec die
temperature sensor and returns -EAGAIN or THERMAL_TEMP_INVALID when a
valid reading is not available.

> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index 91aa004d7137b..e56c848cbfce6 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
[ ... ]
> @@ -1935,8 +1936,10 @@ static int wsa884x_get_temp(struct wsa884x_priv *w=
sa884x, long *temp)
>  	if (wsa884x->pa_on) {
>  		/*
>  		 * Reading temperature is possible only when Power Amplifier is
> -		 * off. Report last cached data.
> +		 * off. Report last cached data if we have one, -EAGAIN otherwise.
>  		 */
> +		if (!wsa884x->temperature)
> +			return -EAGAIN;
>  		*temp =3D wsa884x->temperature * 1000;
>  		return 0;
>  	}

[Severity: Low]
Can this treat a valid cached reading of 0 degC as uncached?

wsa884x_get_temp() accepts measured temperatures in
[WSA884X_LOW_TEMP_THRESHOLD, WSA884X_HIGH_TEMP_THRESHOLD] ([-10, 150]
degC) and stores them in wsa884x->temperature.  If 0 degC is measured
before the PA turns on, later reads while pa_on is true hit
!wsa884x->temperature and return -EAGAIN (reporting THERMAL_TEMP_INVALID
to the thermal zone).  Also, because wsa884x->temperature in struct
wsa884x_priv is an unsigned int, negative readings in [-10, -1] degC wrap
and are multiplied as unsigned 32-bit values before being widened to long.

> @@ -2058,6 +2061,42 @@ static const struct hwmon_chip_info wsa884x_hwmon_=
chip_info =3D {
>  	.info	=3D wsa884x_hwmon_info,
>  };
> =20
> +static int wsa884x_tz_get_temp(struct thermal_zone_device *tz, int *temp=
_mdeg)
> +{
> +	struct wsa884x_priv *wsa884x =3D thermal_zone_device_priv(tz);
> +	long mdeg;
> +	int ret;
> +
> +	/*
> +	 * OTP trims read back as zero until the codec is initialised. Report
> +	 * no reading rather than -EAGAIN, which makes the core poll the zone.
> +	 */
> +	if (!wsa884x->hw_init) {
> +		*temp_mdeg =3D THERMAL_TEMP_INVALID;
> +		return 0;
> +	}

[Severity: Medium]
Should the !wsa884x->hw_init check live inside wsa884x_get_temp() under
wsa884x->sp_lock instead?

The commit message notes that before the codec is initialized, hwmon
should receive -EAGAIN, but wsa884x_hwmon_read() calls wsa884x_get_temp()
directly without this guard.  If userspace reads hwmon while hw_init is
false, wsa884x_get_temp() calls pm_runtime_resume_and_get(), which takes
the regmap out of cache-only mode in wsa884x_runtime_resume() if the
device has autosuspended while still SDW_SLAVE_UNATTACHED.  On initial
unattached reads the OTP registers read as zero, hitting d1 =3D=3D d2 and
returning -EINVAL instead of -EAGAIN; if the codec was previously attached
and later unattached, cached OTP values combined with a failed volatile
dmeas read (0) compute a bogus temperature.  Checking !wsa884x->hw_init
in wsa884x_get_temp() under sp_lock and returning -EAGAIN covers both
hwmon and the thermal zone and avoids racing with wsa884x_update_status().

[ ... ]

> @@ -2194,6 +2233,35 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>  	if (ret)
>  		return ret;
> =20
> +	if (IS_REACHABLE(CONFIG_THERMAL)) {
> +		char tz_name[THERMAL_NAME_LENGTH];
> +		struct thermal_zone_device *tz;
> +
> +		/*
> +		 * Register after runtime PM is enabled, as the zone is read
> +		 * right away. dev_name() is too long for a zone name.
> +		 */
> +		scnprintf(tz_name, sizeof(tz_name), "wsa-%d-%u",
> +			  pdev->bus->id, pdev->id.unique_id);
> +		tz =3D thermal_tripless_zone_device_register(tz_name,
> +							   wsa884x,
> +							   &wsa884x_tz_ops,
> +							   NULL);

[Severity: High]
Does this fail to build when CONFIG_THERMAL is disabled (or when
CONFIG_THERMAL=3Dm and CONFIG_SND_SOC_WSA884X=3Dy)?

wsa884x_tz_ops is declared const, and IS_REACHABLE(CONFIG_THERMAL) is a C
if condition, so the call is still type-checked when the !CONFIG_THERMAL
stub in include/linux/thermal.h is active:

include/linux/thermal.h:
static inline struct thermal_zone_device *thermal_tripless_zone_device_regi=
ster(
					const char *type,
					void *devdata,
					struct thermal_zone_device_ops *ops,
					const struct thermal_zone_params *tzp)
{ return ERR_PTR(-ENODEV); }

Because the stub's ops parameter is not const, passing &wsa884x_tz_ops
triggers -Werror=3Ddiscarded-qualifiers.

[Severity: Medium]
Does passing NULL for tzp in thermal_tripless_zone_device_register()
register a duplicate hwmon device for this sensor?

wsa884x_probe() already registers a dedicated hwmon device via
devm_hwmon_device_register_with_info().  When tzp is NULL,
thermal_zone_device_register_with_trips() sees !tz->tzp ||
!tz->tzp->no_hwmon and calls thermal_add_hwmon_sysfs() under
CONFIG_THERMAL_HWMON=3Dy, exposing two hwmon devices for the same die
temperature sensor and causing userspace hwmon scanners to wake the codec
and run the register sequence twice per scan.  Passing a struct
thermal_zone_params with .no_hwmon =3D true (or .no_hwmon =3D
IS_REACHABLE(CONFIG_HWMON)) avoids the duplicate registration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D8
