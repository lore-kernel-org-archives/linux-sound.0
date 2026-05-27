Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F343F39E9
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779879473; cv=none; b=pr1afZUJW2g6mENiSl7IgtpSSrHVgvvOoJ9ShTZ21H0LeUo0T924JIB2lw70M9M0m1F1375/MPRBfGv4Vyc1kSJFetLJXJTil/LvQoNO+7pLq4uvH5M73z0VQEgB2wNK1DP2GvWWC9pvCvKIFgJxlHJMmf06t2haAj0F7x/l8/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779879473; c=relaxed/simple;
	bh=aU5cYo9HNWiFmUshofa9WImypTaHy5j/sVTcicZF1OM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Y7YR3hpaEuxaqwlNCLECFR5kZzfhDxABrbGBP0IDpek0sem59uLaCqRim1qbqH7Qm9OjDVOgSPufVS2hO2ZrG50Mnd6qyEFn2h2p2IJVYo16/iqWaT+Cfy9mfrDWXjG2D5dVFj45rJcmYflyzwWz5DQQBY1oMiReQGHpyZ+WEnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=PvFpr0R3; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="PvFpr0R3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779879459;
	bh=/zfaz+qzEw6lwelOjuwa/HBbKefTmUFYlZbs93rpr+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PvFpr0R3QO5OStvxaqJAcvO91wCxEjaC86HQeqBiOLtN3Hu2KOASOmfS0LLxfNAxd
	 EiSuDxda2btvGvfyeLAMs/7dy3+69XXaHeA8maIC1bNF6B3BL6zryRJkH+lzM95lcw
	 9CBhP9Vn1eG1caNPXNItV6inyRUrNmyELA5Rk2HU=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E65380ED; Wed, 27 May 2026 18:57:37 +0800
X-QQ-mid: xmsmtpt1779879457t3m4aykno
Message-ID: <tencent_403B9762AF1B7AD13577D70C061780768C07@qq.com>
X-QQ-XMAILINFO: OQac6g2KrvnWm7/Omk51I7BZm2+T0w0fNR1r+X7tiaOoRmAB1EplAmSTNv0KO/
	 frz52MFr4AJt+J2J6/nwpWldQgIu/m8Jit+nhDT+KrYK9R4kvk9nFJadGSzqnNWdeaR2oq2j5xIl
	 G2JGamuvQnpuh5m2HbuLbys3bArd7UZPA8oPLJKKT/jLLHqSFB0tx+u8+HZJ3cGI5osHSP5GC33X
	 9pI25sxvb4H09mmfM3c7k21Z7QTu3cJuoM43D8MdPvVKOc6ttjSbOGH2crcmJCya1Psiz7ONYYKx
	 GEWUA42kylmc3F49wbEvZZSdfLg4zLf19Ne7E0mmTt8Ue4i39CR8pLJbdVNZPJh6gCB0oLuKjiHS
	 YfxZlfNJPdkPtYdh0oPlJ0P1SAVH7eq3YZ1D3bOweSX1Z8haxOy375MEoSXdV5uUW1Kqh0X8PovH
	 jG/FDDWuZ0QGi6kgIxKdIvLiEEN9yuQ/odJBvrFHS9xjq22zUZxYIjGrJstIarAXe5v7T7HLZtCE
	 GJ6Pz45/nm9Mn+ggcY+IwobLS7wPp+2frwwuH+TQtizolwWudNfc4MfRI1lpOPqbO27LHJ0gq40v
	 uU+AZr/qDdz+tmjT4QUJHN+BXU/LtdfiGxo6+PYTpdKDRyo7oGGdsfGg1mjGgfYSyufAdt1pdvoj
	 ppivm40jYVJcaplj2FnKeRImWSH+NVK13yUzLP1wVV4hy8CtILLd2WlPdfAgC6sdHRa/fBnORASt
	 oD6WyXVJroeb96Rev4JKju42+F7YpbVSNQlPLX9YM05mnK40QBABlQ16pNJxMn7toyYkcwaEd5eY
	 TNI4YfVFZf4V8Mt84jzlOSisTL9NkGXjxcauT/YyxfP5EKMgT8VqVnWw9JwLQoF8/qiYz19NEhbG
	 gGnXx1aYazzU9AWtfM8VbyLrn2zYoziwUi9Upl0AnCxQTFC4WwgH6lw7SCNdWb+LjZndSm1woBPZ
	 QtRuuE7ptBLKuJuNUx95AG07MMDyEviTobWyiBqG1ncaSdzOzrHT6yhhn3/t9t3uDGbBaco6lY26
	 TmNzzdQBS5MlDZyLvAULNjs0SzB7sHxIKzsqmfsRagKwUZ8f8MFlKsFyQ0ZyqKNmysCf0zWg==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Zhao Dongdong <winter91@foxmail.com>
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	winter91@foxmail.com,
	zhaodongdong@kylinos.cn
Subject: Re: [PATCH] ALSA: check snd_ctl_new1() return value in multiple drivers
Date: Wed, 27 May 2026 18:55:36 +0800
X-OQ-MSGID: <20260527105536.455004-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87bje1w34u.wl-tiwai@suse.de>
References: <87bje1w34u.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 27 May 2026 12:36:17 +0200, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 27 May 2026 11:09:23 +0200,
> Zhao Dongdong wrote:
> > 
> > From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > 
> > Check snd_ctl_new1() return value before dereferencing in:
> >   - es1938
> >   - cmipci
> >   - ymfpci
> >   - ice1712 (aureon, ice1712, ice1724)
> >   - gus
> >   - aoa (layout)
>
> Could you split the patch for each driver?  All changes look
> individual, and that makes easier to backport to older kernels.
>
>
> thanks,
>
> Takashi

Thanks for your review.
OK! 
Originally, this was six separate patches, but I was worried that might be off-putting or cause you trouble, so I merged them into one.


-- 
Regards,
    Zhao Dongdong

