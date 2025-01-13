Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F6B2F852
	for <linux-sound@vger.kernel.org>; Mon, 13 Jan 2025 05:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736746434; cv=none; b=cn2K5b7Z7LmyRcJ1y4ndQ+7ecp0TWW4zAMYzr6ug9mYZUIy+Iy1iPZECkN7sOjy11D8HHhLyMKtwD9T0LZfxyVfctn6sbbyfiHscIg3+EvummSoCidK0GmYjNBeqgJqmuNBSdVCSigf4NkhoYnIRO3MCvRtQ713YQY4dQ0/jt14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736746434; c=relaxed/simple;
	bh=5heIPAsKRGJhjd6yh/aHAsv4y1PGz6QQ2oa5DxdPkFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+GIdOAo8/XOzDCWg51TGSUAcTF6leGm1oeCiWS4FYmfK06vBQI9pPfW2V9X/OhmvxeLXdG3ahg604GxuFlcpScyo3w7YDxuSfneimjWAHs/7+TgjW9Hgm93zSMo9I6Wl2RFuOBaQ3a30VqyqXn5P+nmzOqbPs6klRp1O5QKSWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/k64NZZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/k64NZZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaee0b309adso640192566b.3
        for <linux-sound@vger.kernel.org>; Sun, 12 Jan 2025 21:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736746431; x=1737351231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jx9mLYUd3fwN1g6ctPLax1GPr6UmLJ/TnHHe56uL/18=;
        b=k/k64NZZaWMc4dtbJOeYAg2OVWUj8jfIru9GyIrHH9VMAC/cnqcRueTk+0F3m2sJ+/
         CxzxhrWUYTWujeVOesx6cqNSza09iD9hAoIA/9TNC29+6FETr9M7IRi97VbgbfXs1/Hs
         I0MOPQP0ClzR8XOsZEciqehQaFV4I7wmIpNMKsUGc3DKYDWCtphePMm8THCsURNzRuDz
         Ch/yU+mdUM8/z6xATBPyY6F7+DjfUHVGi1ovMmjsC8GKlddBOOdeA2n9ZwcXL/KTknlU
         B8bTm7FNotFS3/j6MmnUtpJJMlK/mPcT9DcVXGIT3IcNDgHnXPOj7NxalqigunLxn1pa
         hxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736746431; x=1737351231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jx9mLYUd3fwN1g6ctPLax1GPr6UmLJ/TnHHe56uL/18=;
        b=jl/zwsDRcm5uScwVM70mOhzUZhSzKwWFM6l0sJoYu7EFIudKp15YNPRs6is/ilAaZh
         Qtc0yJQ5sfRbXXQGToSjCVXLGyHWzyo/e05priMuc6JUYVrawB6qtKdgDLw1/2Qv4lPV
         k6zOztI9uW4Vvy0eR48NV/YwEuYM3jIluKvgzFjUlKvp/JuNUL2FiXK++P0gHkUxfGG8
         rtawhIrlqGjVDy60ehcuGb6PAqPIEhfb+1/DCrWQ1VHHB2XyrNElKPd4cAAwyBSk0vpV
         JwEFlW2SNjC/m8ZmlEi1RhBryVOXyWG1J66CwEfzzAPKVox1gfjykJZiVkLKUqY5QOr4
         Lrig==
X-Forwarded-Encrypted: i=1; AJvYcCVZG/M5q6sSHUTyhvdIsvDnQ0JIaON80s5dhhQtq7It/NYvjV/XPYTinBBrKkM05njbM+IM9XNZoPzNdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYiVIAH4M7pZUDrjr1b8imQGUuQU41PGenzHHqobzKqAYufshY
	bjx/RpIN20k92x9tAljtjK5tV9p71dOuhlkuMzowB+076fHeSKe2AQpXFZF7jVA=
X-Gm-Gg: ASbGncsoleZa1Kjhfs8aIhNNK4L5W1x9HbQ+ZLadBxPv8HRFnhxyKNDrNddVwCadgoR
	UKV4YHNYgTcCbS/q4fIi8SLNFg2vCPIWq1smiLS751xN7uc8wQMYNl9WfIXoYcEfc8rMv8OaSR6
	opnP8T77YNaOQABjs+cGJEMV6Ie2oFoe8UlYIGGHR9f6srNM7UkQr0uENpwGqset4YbSQqgbZNR
	PsyWW9WcYW8bZ0cyIcTnCQMhS5969ejxgAgkCdomABcwSNsJOXypK+KXjjjBQ==
X-Google-Smtp-Source: AGHT+IFYw22y/eLH77Gjbmv0pKt7BPnC6SN4yqVobhVoCI3kGDgmTSZ0ZbPrn8ago34vjn93qCioSA==
X-Received: by 2002:a17:907:6d12:b0:aa6:950c:ae18 with SMTP id a640c23a62f3a-ab2ab6b5406mr1508679266b.22.1736746430617;
        Sun, 12 Jan 2025 21:33:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060badsm452144966b.29.2025.01.12.21.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 21:33:50 -0800 (PST)
Date: Mon, 13 Jan 2025 08:33:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Baojun Xu <baojun.xu@ti.com>, robh+dt@kernel.org,
	andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com,
	perex@perex.cz, shenghao-ding@ti.com, navada@ti.com,
	13916275206@139.com, v-hampiholi@ti.com, v-po@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com,
	broonie@kernel.org, antheas.dk@gmail.com,
	stuart.a.hayhurst@gmail.com
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID not found for
 tas2563 projects
Message-ID: <92d30be2-4f77-455a-ae5f-8fe4a5a365ee@stanley.mountain>
References: <20250111095728.1232-1-baojun.xu@ti.com>
 <87ldvgtp36.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ldvgtp36.wl-tiwai@suse.de>

On Sun, Jan 12, 2025 at 09:26:37AM +0100, Takashi Iwai wrote:
> On Sat, 11 Jan 2025 10:57:28 +0100,
> Baojun Xu wrote:
> > 
> > Driver will return error if no SUBSYS_ID found in BIOS(acpi).
> > It will cause error in tas2563 projects, which have no SUBSYS_ID.
> > Change strncmp to strcmp to avoid warning for weird length.
> 
> I don't understand the logic.
> The use of strncmp() there already matches only with the exact string
> "INT8866", not the substring, because you use sizeof("INT8866") which
> is 8 including the NUL-terminator.
> The only merit of strncmp() in this case is that it can be used for an
> unterminated char array.
> 
> In which situation do you see the problem and how does your patch
> improve / fix it?  Please give a more concrete example.
> 

I was just confused by the initial code and wondered if it was
intended to be: if (!strncmp(hid, "INT8866", sizeof("INT8866") - 1)).
This change doesn't affect anything, it's just a clarification.

But the subject "Ignore SUBSYS_ID not found for tas2563 projects" implies
that it's a change.

regards,
dan carpenter
