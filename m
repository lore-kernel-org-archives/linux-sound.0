Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A242D35675B
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744488; cv=none; b=YoZKCFmpvH3vAnByECCnOcuq0+CjfXrIwaGNZvjnneeL+DvxBXVMmYaWKpSDsFy8aoC3ycXrGw0NvHrhQ+mQVBOvM9No/k792VbXtATC0sKI2APrQpgIAjuSrnEuTMsF+QGF9m1Gfp8/TMmcMmYoOycb8jziab5fjZ2KoGLrhuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744488; c=relaxed/simple;
	bh=sr+7kyomaZYJVsJ2ZwipC1I4FLT+ONNiNElCexe8uzQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dQKtxRjNxnZQ9ZDb7Wxw4tFpzaOl4xS1f9aidvZ+1chFWAAeYGh8/Py4S66SPC4UHfAHs1pJ+CHA4tyOTU7EgwSQ/ELeGkFbn5h2I2k3dYlp6Y3brwShlfl8NKmWkpiI0HC3KB6FbdPlc762uSDEoBF8v7LUaNH0/vyUR0we28A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMFH0aYe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMFH0aYe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so780365e9.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782744485; x=1783349285; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWhKW2eNrkhNPnZK/AJGOmyvgWT8TkmGzQ6dgobIakQ=;
        b=LMFH0aYe2N2T0Uxgt+jl6lybL3wPAhO720WkME9ztZ0WCzXrP0ewh0CMJJwEIi9bJ9
         z2F6wfNbo8/daZxHiG4nhPR0Oc7+2CNCjwjEtlQ1C6CImn/K4w2ppelwIfY6pqs3uoom
         baAPeq/iJeVTUuwo5+EgMIe8/b2yhM7s2H7J+x+AbgKyZzcTIr+C0g4c98Hb6s7Yjiv8
         4ETRVvttSNWCbc9silw7TvaOzWjLsAJhSPVsHGI51jY8Lx50R4yUkVYD8EKjtc+6+D0u
         bPxmlmTw92p0HaI+NOArqHnJXNlvIMWfoS4nyqCKZrjPJx9/UZJteoNefeEDBEAYq8JG
         l7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744485; x=1783349285;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWhKW2eNrkhNPnZK/AJGOmyvgWT8TkmGzQ6dgobIakQ=;
        b=ZSTKOk1Z6AZVWKU8EMB/LQm9v0Vdrio1PWZwRGkXmvyQkU0zt4LfCmSXEklyatl3NJ
         4l+DotYzgWb5wtxoGKpZSt5r3Vf8I+Inehk25v8rJxg60CmdmUN5LGlHLX0+RuSUcRdD
         nd9c+lNCBpviVJ/JXlmDryHWJsfeiL/CjpEoM8+CXwqjrDbdo+FKgwGldiS+xCt7kNwC
         mgNDtJK67WV9hYs65Ba98Tz086FzKC1XT06Uj8puwJ1FfxATRq+ohCop39FsvxCYJ+j1
         9I6azsCDcX+xZMiovTWvSMQzglR0DwTOTZhEptYpGyrrrQ740//c/p3Gf5PWVQrLbkni
         QrTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gxmO3BCE9GkXVv0X6AwLh9CMd0J/40iIEy58GH57PV+Xdydg/sH3qDprxyUS573qjutfSwdHw+3mRbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNzDm0UtInzEWFyheGe0XwN1HGApII5O1P655930YeQerP7l4w
	t+igWPi8sQ0OJ95emjPoEvCHYGFJ6vCI9bL+XPDc92mBJhUmCV0Iri5y
X-Gm-Gg: AfdE7cnEX7ybHER1D1Yjbj7rrZK2uYzhKoQw6HvE9QDGu1O59vwx00yUxDM1gxhQs3U
	vOMWp+skeY2J6pQeKayn7nZG4v8+/rLJUjk03q00IFnJEZFlj8eW74+vs5KO7MhIm/iVM2j7jLi
	CpUR5vRGGcS9BnO64A7G7fCjXBwdr2kCD40CMK8wrp/MGXqJQoAAfNVDey0A1KYlOscb7AlWsOs
	6czrJG3FdfA6bd4D/Kd3dW2y0ljRizDVp1CS3Zg0x77V+1UkcMzEyz6+9YhftXAWM0cNmMq75dJ
	Jo1hT0XfG2C8iu5IwCA1x1eyW4ScCf2t9psHRVcReFswfEGf88t4VMtZtRfT7m5dLVtXoCKXCGf
	Mn7Y5+rawTfSyTXcl6rs59kpXUUvstqh+I160JW5IrC1mjnPaALHmFDQZrGJa5yX1i1o13vnFjU
	DU6uradNwt1YF3i+nGZdmTHbX1anzd/xVwJ28fWYIDAs2s7rA6ngCLrZXnQ7JVS9NjnJmQ1BuBy
	YrZ8h1gZXkp6F5E
X-Received: by 2002:a05:600c:8b08:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-493b8289905mr175815e9.14.1782744484783;
        Mon, 29 Jun 2026 07:48:04 -0700 (PDT)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fc0f32sm321549885e9.3.2026.06.29.07.48.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:48:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF
 datapath on start/stop
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <1jwlvha6xv.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 29 Jun 2026 18:47:44 +0400
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D8EA185E-1F9C-4655-82C9-2C46A035782B@gmail.com>
References: <20260626080422.4191435-1-christianshewitt@gmail.com>
 <CAFBinCD5bn5VixbomCz0nmHuopBmgh0CJc-V4jY2vdXhoP_VCw@mail.gmail.com>
 <1jwlvha6xv.fsf@starbuckisacylon.baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

> On 29 Jun 2026, at 4:04=E2=80=AFpm, Jerome Brunet =
<jbrunet@baylibre.com> wrote:
>=20
> On ven. 26 juin 2026 at 22:41, Martin Blumenstingl =
<martin.blumenstingl@googlemail.com> wrote:
>=20
>> On Fri, Jun 26, 2026 at 10:04=E2=80=AFAM Christian Hewitt
>> <christianshewitt@gmail.com> wrote:
>>>=20
>>> The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit =
0 +
>>> AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
>>> vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no =
equivalent:
>>> it only toggles the IEC958 DCU, so a stale datapath FIFO can be =
replayed,
>>> producing the "machine gun noise" buffer underrun - on start when =
switching
>>> outputs, and on stop when playback ends. The latter is audible on =
devices
>>> with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek =
Play2).
>>>=20
>>> The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) =
on
>>> both enable and disable (audio_hw_958_enable), and when =
reconfiguring
>>> (audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the =
same:
>>> reset before enabling the DCU on start, and after disabling it on =
stop.
>>>=20
>>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>=20
>> This matches the vendor driver, references:
>> - fast-reset SPDIF is triggered on enable and disable: [0]
>> - fast-reset SPDIF is triggered after all of the configuration is
>> written, then DCU_FF_CTRL is enabled: [1]
>=20
> Take what the vendor driver does with a grain of salt, especially when
> it comes to audio
>=20
>>=20
>> [...]
>>>        case SNDRV_PCM_TRIGGER_SUSPEND:
>>>        case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>>        case SNDRV_PCM_TRIGGER_STOP:
>>>                fifo_spdif_dcu_enable(component, false);
>>> +               snd_soc_component_write(component, AIU_RST_SOFT,
>>> +                                       AIU_RST_SOFT_958_FAST);
>> It doesn't seem to make any difference, so just for the record:
>> The vendor driver first triggers AIU_RST_SOFT_958_FAST then disables =
DCU: [2]
>>=20
>=20
> One could even wonder if there is any point in applying a reset when
> everything is stopped, if the enable path will apply this same
> reset before anything else is started again ? Does it really changes
> anything to the reported issue ?

Using disable/reset or reset/disable didn=E2=80=99t make any difference =
in my
testing, but without any reset playback stop on the WeTek Play2 board
with hardwired DAC always triggers the buffer underrun.

CH.

