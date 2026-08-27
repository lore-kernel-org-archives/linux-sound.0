Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A433A450F
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 07:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787817498; cv=pass; b=Yqy8DRvZs3NqNFnQBWl51bUWMz+ozKKBfIQRL+hB7Q5x9M2Ll0zcNBip0odFP8cF8CFCn1bPCz7q/SH4a2i4JgNCUowbYrzlTta+KZu9eQB+F5AcQT9mTcxntdqvQ3ljY6qsZ4DvHxoY4ty9dKT+fBfTyn12dmupnVjmr9oAwlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787817498; c=relaxed/simple;
	bh=lotjI7DGya2jvffM5uBbsyWkSe6sFtu18wkc9M1Lrzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BvTpWH44HG8a9kNiwKVhh6yyh8Mf94mFoextPxXywPAV/6ZuAGs8sNECcadMe0b8wpu/wof2HMJb0k95JNbvVZt35Rf44y5VLi+UrUNMr+rPrwtIXww6+LRjh/G1GC/+K30AJlIAqCXUr0AGvtkVl5p45uFWg7D0SPnG76/sKZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+agFnWQ; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+agFnWQ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39266382df6so363722a91.3
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 00:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787817496; cv=none;
        d=google.com; s=arc-20260327;
        b=QXqKd6sJxC/1aselpeRauYyiMwsBUGxk/LvP2aAIYNfK9uwQDhZiCNzODrWeVyPQ8p
         zy4TS07IYrKnQtaEiZZLSElVEI3nHlcoX/EPgNZWINXmP83m/f1dM0XqxZ8GOycEkNWj
         yRpjChhh0POwBGqmqNIvR7oPCB2GQNLsO2Q074YWONtYl+3OsiAxv9TpVb9ViDiYq3bg
         FjJREvBYPepfjDmuHPcTcqkkwkPTcsRTxzkpt/RB1zKLv12wM59yWPhfbco8J78mYW1j
         NcDwyjfdtPGzMqRZCC+jr5kXqD1v+By1R0webKYE3jdH1WgM5JabAoEczj3XU+/RZY01
         IuNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        fh=UsigSMBFEVU77qakJjF/A8YYz5U+XInsWfYOjuCY2aY=;
        b=VlF8WEswPl3jyONuiPoQadg7Oyr9CkatJJtI5Ie9fM8z2k6uRi9HYEDBuXVxxxt9hH
         AtEUm/EG2/j4dPx2x9O8OK9OXYhA8DOZ2WjMheWQckgfPvr/SEG8ItgWrCebQ+8Qcd2Q
         QV8nv/dAg88xQ7lVl+Si2h48k7N/j/TOpEdl/QKxYGHEjuch+r5MTIRvTN/AUAqchUrD
         SOPmHd2JLOJMVnZAUSNiFW5xJzZ4hEddUFn4rq7u0nLvNwaRDG006pYYc8GXTDT8lSfx
         9EEAAWZVBq0N5/7pGzS/7tyki1gDdvywYaW6aoUMvACCbjyvW5b/XfxsfIAfY3Y6+d2f
         2A8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787817496; x=1788422296; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        b=f+agFnWQdzfVJzq26Sxor8l0kPRutQBRGUGYa32Ue5TsaUDQAVTkkv6HL08DmxKmu8
         MU+Iw9TNU0MwvHbIsDIHQHSoRnjKCu7dfZjLacyk2Ww60u2gzNgNlVh7tyAN2r0zZqOz
         +XYosVZrgabCLVV6YFBsCaie1Yd1rPx46WtB+ebiyo8SRbuDKCUoJJTb+dElS6EIsF6p
         tUNDPUir197+kEbxO6Li52JGFEB4wEw2m4sHxVHjViboFuJawf5+x17KecHay80ZO7XQ
         6WqImGMt03Q4SVcs2FpJEozZiqKbyJ9M0XBy06wWy+vVl7zQq9t50qjNoYgTVeJwso/h
         HLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787817496; x=1788422296;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nrk8uUDBNanFfnr96a4o3nFXywW6wHqNdCn0K9fnuO8=;
        b=bFwS4jzK1oTA03Z0qrJLW5WEURDsIQKFhQwuT6VPW1dCGWVFOzjkFm8mJdPppc9Onr
         qhkMUbBAwfNwTDrZNClXYsH/xMdPzGmOOIshdeBQWJsiW2ZZb7gkUzQWPcMR4siH/N/8
         3C/Jslh3b8vwXwhNGC7BRkmvkbuTe0hgxAeopWYs7rSp7xW0OAd11A00FPfX3GnNWV6z
         ANK0D+sS3e9/B1lFvB2RaHloUmw2jsm4/0VZk44Emnlg66hnh6/Ay3fNfo8ILLL48Rk2
         dFOVQ3gwfZY8t2rh9ld9+3KBATzYSXvYDg0s48lHxXrIQKeSINzODNnghoRtl/65cg9V
         hjvg==
X-Forwarded-Encrypted: i=1; AHgh+RolXtzinQILC3CeffIjxXjIyqv5jVR9ulae3/UScm0M9P1T50D8WCiafKP4/CyOkNUw2ZFP4FKSA3A/kg==@vger.kernel.org
X-Gm-Message-State: AFuF++kxqu13S6Sv1EzWa7yFp1cJn5GXZ+rim8DUSONGkKO4As4Hhu7F
	QR06yqNXNtTyD1RdGew0/ULdrCwTMv6e2k1EVMMV3DKiGOD/v0oIl+m9U8soAP4Fnq70R2YZppE
	9wtUrg+pksV2cAFjWpK4ImgdP1hiDHtOxWxxi
X-Gm-Gg: AR+sD12mhKVBd03JeDFzIVdeWbLWlMvznEi4/MkKepOIJ6J4nCDn0IyeesoqUW/CxlS
	9MyhhbGbgQTi3CIKaeTBO7rE/vK06ecVLTkRiGOc6jru3x+vbMWwBGBEMnwcgu8Q53lJSZV5r5+
	Hk6r+h6AUJPycB9d9BJFpN5P6Mntn3mHXrz6UpwZIpZgcJ+PIgk5dr6F7gKwQsVMEl7DrBSHnTN
	A8dzGmmXWdxfjkYekQjVOnO2sdoIABgnzk3YcmK9InaaJaUvwMGbiJd/wlIRFSPZh4z2Scq/Yd5
	VNIDnG51cUSpcwCG4WUG8Vn+YczD7WvT9lsOzDZ73tgiFsgRbZ+rm+9KTngQFbOBSo8DAhgVWXE
	6MQN9pFJkyqx+AYuLB7tIkKK1Ai9fZGu23a98wp8uZplGx8EHrz0pKnnw
X-Received: by 2002:a17:90b:1649:b0:37f:fdc8:71b4 with SMTP id
 98e67ed59e1d1-3966d3fe36bmr25869449a91.2.1787817496356; Thu, 27 Aug 2026
 00:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821122928.41343-1-phucduc.bui@gmail.com> <20260821122928.41343-3-phucduc.bui@gmail.com>
 <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
In-Reply-To: <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 27 Aug 2026 14:58:04 +0700
X-Gm-Features: AcwNN1XimKrPZge6zf8CptLL1uRO5gf5i0cHec8ah767upjHTgiSMh8y0Tz3b7w
Message-ID: <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review.


> I have mixed feelings about appl*_mux_setting().  Take a look at its
> disable-path: if clk_set_parent() fails the follow up
> clk_disable_unprepare() is skipped possibly leaving one of the clks
> hanging.  I'd expect error paths of callers (of said mux_setting()
> function) to ensure all the clks are disabled and unprepared
> unconditionally.
>

Perhaps the primary purpose of the appl*_mux_setting() functions is to
configure the mux, as their names suggest, which may explain why the disable
path is currently structured this way. However, I think your point is valid.

As far as I understand, calling clk_disable_unprepare() before
clk_set_parent() should not cause any issues. Therefore, we could move both
clk_disable_unprepare() calls before changing the parent in the disable path:

------------------------------------
clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
                                 afe_priv->clk[CLK_CLK26M]);
if (ret) {
...
goto EXIT;
}
ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
                                afe_priv->clk[CLK_CLK26M]);
if (ret) {
...
goto EXIT;
}
-------------------------------------

To be honest, after looking at the code for other MediaTek SoCs, I found quite
a few logic issues and inconsistent clock handling. This, along with
the git log history,
makes me wonder whether these code paths were ever properly tested on
real hardware.
Therefore, I have stopped at mt8186 for now.


> >       /* setting for APLL */
> > -     apll1_mux_setting(afe, true);
> > +     ret = apll1_mux_setting(afe, true);
> > +     if (ret)
> > +             goto ERR_APLL1_MUX_SETTING;
>
> Why goto? The check is valid but the label in my opinion is unnecessary.
>

The function could return directly here, but I used goto to keep it
consistent with
the existing error handling in this function.

> > +     apll1_mux_setting(afe, false);
> > +ERR_APLL1_MUX_SETTING:
>
> While UPPER case for goto-labels is not part of the coding style I see
> why you did it - to be cohesive with the rest of the file.

Yes, that's right. However, I noticed that the mt8186 code uses
lowercase names for goto labels,
so the style is not consistent across the file.

https://elixir.bootlin.com/linux/v7.2/source/sound/soc/mediatek/mt8186/mt8186-afe-clk.c#L303

Best regards,
Phuc
