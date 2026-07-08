Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92322701B6
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 13:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516238; cv=pass; b=S5rf6GrM4kPE01iNoNXxs3XDJW9nm3+V4/ulgXkIarey9nmVCrI8oSnpRu7bsqNtjOZROB5RmtHS2UwFhMe/hsyxtN18gHpcbFrTpgJSqRKdak435opNAYL873YgYi7WD3kRP3NvQc6sJMUrhG5gTHYzkYTaoK7l0V2YUmGcI8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516238; c=relaxed/simple;
	bh=HIufZrLFYzsb0D/b0hAxQt1xQJpEmXmBA4BjzkB6hKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KT7Wme3Bi90ShF8QL1IrYG1p1r2ggXx5+nyQe/BhB/obFfH5JvqyG7eSatUZBGR12Y6QG1/Le552e2x4Nb2FCG8KCnSE3QL8yyGhXcPwT90SYoEdqxg8I5p4JeVUoq4o/9Khq/oiy9BHKv0SNrLfjIOK35yc8r30T2bP1F530Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZG4xlP1S; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZG4xlP1S"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698acd36d67so1391394a12.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Jul 2026 06:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783516235; cv=none;
        d=google.com; s=arc-20260327;
        b=a84Y6aBt3wbSKfUhJAMrM6lrE7sisZjaO52lHIDwbS8cjht3cRpxu0SZ70v43nyOd+
         f2fdO0zvvqcm+O/kSfc/ZGMRf+PgGNgO1n0c8Ihy4PjtUwJSMGlTSqSbjLsJ3SX89jag
         9iMedx9rIAB70D3+89Wwiu9O3yZDtOgKWS1cIsj+GqtfK+Ubb68CgarajxUbtlVMlCoy
         KkhOY34Qpjc/Y2GdCz6U2gI963ZSASyalbECvQ5pC4C9VO06Zh78rb0Rg0vGEU89+SOH
         m03+i4uQnm0fIBTBKCubpCWCztjJ+ZTw9xUcjx1kErIBFrQcIgYAg+FCAhexnLgFEh0C
         kAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UQgZZRxc9YJKoaKSy/ZAaZczPQM+cmnq2qvoIwS3tpQ=;
        fh=J/DDFOXacRuSErs6VvuT4uLdLGG+My0/f8MBm5xNAic=;
        b=DDxyV4x/Ufae/Kd6xjtDraEWttqRHA/v4MMEaUy+bXftp2q/VKxdu+LrUpV5rU5XB4
         szwwV9Tq3iqdRpH2nD7qAJxw88dGDjHVir3kg+t7aNsYvL+FOiTH/wA4XyFAM1B3QR/P
         FMfZFSyDIIVF0g72DnkULuyJTqTp4HnsmO9NBamQtI4HerT8BRJULtZaFcTHZCdTJ96T
         gw35EG1BoPippJhxYbW13FyDRLyUwptqxX+ak0lnAwwvgCr8pvu0Xjs19YJc1HO7hUB1
         zQGFkQUfvMIXt0kLIHHiBcZF4X4DmhoSYK7nYud+jiY8T9dn0+QNyie4ki9XGWAbE12V
         dWyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783516235; x=1784121035; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UQgZZRxc9YJKoaKSy/ZAaZczPQM+cmnq2qvoIwS3tpQ=;
        b=ZG4xlP1SBAkl4S1CySJp1Px5EOCbAkqz4cKfs+39Qs/boJ99mdukAyg9CAwXxEYoe/
         FH+Xgx2NuYCBh1ukse4VRQa2LPL364N6fdB5ZOdIkY8hXoF0aaNXZFz1dz/7B5DtQPUd
         NuxVg9n2dw1tVd4dKRqh9WlATK7yQietXzN7eWDwZqIO9oWj2IT1WsxMzjH4pQAQQ/N8
         0eMZqVIS6Kult2mcoCGBiFckyYPcrDsIO0noEQRktjLbo29KXk8vlSUeCo6jOxy2B+45
         h7jZERZ3XNK+ESeY7oU+gk3F4Aj6lMGNI1awWMES4StCF/PmBmqXrA15YL0XXzrc2iYa
         zMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516235; x=1784121035;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQgZZRxc9YJKoaKSy/ZAaZczPQM+cmnq2qvoIwS3tpQ=;
        b=GwaIXv3b1R/1NjNdnOF2oxbea6KcHNddY4Kk/9e8tHaNJJSgDDMQLWgTMqYE1yaZ55
         2bapflm8PbQaifrveTxHch8y5qZslZktp8WQrp4FTG/msGKPMQCMz48qqxHMc6Qlx08b
         zQI633wPaUViEYh/UMhw2kf792g/HP5oRg4QYweCqFTUVxkp3nqIKEVVBksa6GgsoJFT
         AGr2FEETF4d4pIpZWPIwzhnNF0dtVkOz3isxXb9YCrODoQZuDHSo2Za5n2qt36vjRZoo
         SWeRTCVGbJkaQH7JJsC/WDZRfeOchNOtJkinv+EYRn3+lwLdPo8kntMZL2rNAu1Blou1
         Vcag==
X-Forwarded-Encrypted: i=1; AHgh+RqcWj5+2ISki8HlzYHmQCzOVDNzGvdbMivjMqg2oFy6QNVTZAqVXDEXui7uXRUyEN75Ocmq9kVWCUcdVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtexPuJPWPZgiubjYRucx3iL4lrIN8ph9XM/HVK3LHbXTbzRig
	3FQSqzTIEaHkG+5i+IBUE1BXMvaq/keSJf8vJPa7NZAKItIjABLNIPPD9QZ76y7CoIXDN5zdaz5
	OLQaqBG2QYNTtyDasb7SNVo0UgbRhvW3TVEOj
X-Gm-Gg: AfdE7cnKCjCvwRj15oeYl8xX7g+tCZ0swOA5SIypf/9flfpml10m0zlkavtPLPlplzX
	o7QZuQRgipkwOiMI0FW/5CM8k62TskRiXBv8/z/LU3Oy48ZEgRpA6zZLIO5f6f+4I5f3dsx2msH
	p5Cs0JCpPFi3+q4tEyGZYp6Ew3w2kkCL8YDI+fKQJhRd0xEBkxXPXg2FWbHtpz7OmLJDsmMMyYa
	UEmFIdtjRNL6kFPeFVMXzesaxiveZgLqyW1dUW26azBwoIej8TZ0EzmNM2QOQqgbQOtplfTodJn
	M7PWdlxAY3C/tzjdH0RsNo7ohFE=
X-Received: by 2002:a05:6402:4596:b0:69a:9fbe:5cbf with SMTP id
 4fb4d7f45d1cf-69ab4453607mr946619a12.6.1783516234645; Wed, 08 Jul 2026
 06:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708023540.6962-1-phucduc.bui@gmail.com> <f6841e94-3260-4ec0-bdef-50ed73ba8875@intel.com>
In-Reply-To: <f6841e94-3260-4ec0-bdef-50ed73ba8875@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 8 Jul 2026 20:10:18 +0700
X-Gm-Features: AVVi8CeXRcIjPE4qdJjV228HNpIi4X0_XPcH42a0k6-cgVE5PkVYqB1MxCEa1uQ
Message-ID: <CAABR9nGpMDdWqgxJnMTj4JMNrYChO7anhgXkH0qQ7vPtej9ZjQ@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: control: preserve snd_card_file_add() error code
 in snd_ctl_open()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: cassiogabrielcontato@gmail.com, Mark Brown <broonie@kernel.org>, 
	Kees Cook <kees@kernel.org>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for the tip, appreciate it.

> BTW, as you've provided a number of positive contributions, a tip for
> future:
>
> The change is simple and does not relate to any workaround or some kind
> of 'recommended' sequence.  And thus there's no need to be as verbose.
> IMHO the first paragraph suffices - explicitly answers the _why_ question.
>
> The last is completely redundant - return code is a functional change.
> Similarly, "Fix this by (...)" in context of such a simple change yields
> no value for the reader - we see _what_ is happening clearly in the code.

Will keep future commit messages more concise and focused on the why.

Best regards,
Phuc
