Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524471;
	b=XET0U/IOz7e3oWBy5JUE+CTK3PFQTxkyux2AVZlqPrem4oU0h9fYmUqOXANdyYrXkhKe
	 jz41onEW6rTgSaho6urVbbnj056X4Bh2swvT63mCcDcAhPxv6j68qSFNwdtnjpOVxtlON
	 tZI2fQecuhrIF7Ycjp5AoPoVj+gFahoOGYcSfR+9G/Yclk/YKSgh/akxn/EzE/k8+y1g6
	 AbEU6MjKAHNS0b8YdcjLHygMINBCQDIp/1le9vwk3w++tnN79oR7YXef6y11t4jgSwbOM
	 xeEXKQ7/RFIvXsZk0pJgbHDUaicuGt6pSKrfadGiYcIFUWPRl4DpbS4sOfQUsWe1CIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
	b=SnZaeSMp/BUQQ9M/L/NLSFVXqEyuwnKriG3fKwYbH2fUVFwVY28Vn426DmviRUYsuGCr
	 NnQCMdo40EVOxdjzvlNoG6Dk1DpmTBdybJMQl8VMhxO0UBX3HkGWW8Ea8BBNNkqMgHrHx
	 Snq9mGxiepDuwOJuqPAy04jhLEkAkr2/pyp6SuQCOWAsMsvVvma4d3WEOnhDiE4Cc46lE
	 Im2ENRUBVzmYCScDnOk+rGHWrBfpOLRYb6XMZsO6+VRnMeaOvGSja39P0O/xubTeqCDkL
	 UxuL9kiTOBZftacR0w9ChYjuWWqnHlw+GAJIfTlFC9/gLpT/ATbMuf2jTukzkP/iRlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=CXlT56pF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D185E606A88D
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 23:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D185E606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=CXlT56pF
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67be6030c9fso352683d50.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 15:01:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524470; cv=none;
        d=google.com; s=arc-20260327;
        b=P7a4xMEfh8Dyh/zwmwLchfKDkUDnMzvygiETiFtDUA4RtDime7I7u7fjCs2HF67Yqh
         n7qiNT5M4rj03G7ieoTLp2XRP1wbwJsMlYtU+ugp2frKOD6OhyautGxvmAz9gOvBluqT
         AWFJhwWLoRCl3rnRDuzVBrNSUS9a/adenhJjjqxm+pR1r9CurpyLvpxVjXjgQu4kUhla
         VekmbTA5Gv6v0zPH/Sjl8K+W0K9JQ3nSZg4TJO6/cUErP56UhSe0J6o6cSADWLegMYO3
         4QbH81YqYRQePvDaqtezLIcdwADcCwRnWAy/5CkaCYTOmcTuuKTGEzp6o+cxTeq32BUc
         IHww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        fh=9IceYDqMgXjR4eVhFt60qdaA3n/acAX39N/mMYjSqLc=;
        b=aAXI67+fxg3okeaFlTwhQpgwzNbIhVZ8lTJ22eXwE8H24AZWMxU1xcOqjG89LtQpWk
         tc8ELJK/pgNBIMkUJksTdQCPiS2bwOk1gPxfen2HDkNI+ZgBbwuvNRSXZOuMYnUVpKNh
         gUXUJywiNV8zMWXMrnbuqDf8WpOBljZB0LWzwXvdISOCULoJ5NS2a4O/xUj9tLuwOfCR
         4gKZ27L1/pp3Cmwii4eVAcjwqoI/dRC3jMZi2i+O4uNxEV5p2HsEDo4NoxHg08jBEICd
         PyPhbDKG444F/NvmfSWB0Rd6tJB4xE5kGhBnFLYxzwcvy33m1rRmOVih7YnRmRJ8XPr8
         TmsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524470; x=1795129270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        b=CXlT56pFul1lv1YPKO8zZAVXf8GTj+cVomOhtG7fVNxd1Jizl65XkXtdLpXxhxYkfK
         MG5qJRszhp4MR5CBfSPPc3BXoOxA2LGLqbkxcpi3ENrSA6WnFNDe8b+q+gKzjladg5tP
         PG3HzYXcvOZDkQHF9bTQRJL1loqbWULjtrhJO5HKRR8Z3GLoJ7CLuW4n11zrTmHyGw41
         kahbPkzAa7mK9d4QhaOd9CrBPzwFxXJDHISZBKi6iTpqyGesDYyLxfNNm48K9K4LuOVp
         9Sq9yEzO66xQvYpCpcyrxaSXwGYjasHUy9jgXCFFw+2b9l15TM+VPB70lVoYZfL2CuhS
         1YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524470; x=1795129270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        b=Gi9e+rQwAzeRPA+7VuEyrcdpnY4lhloBARWG7W0Ejywh4KaTLsaJ4+Q7bPW79SaUdf
         LovBZ6j+Vf1ezCboT8KHQnsCFZK7XdbfPFWX+B/V6mD+Bkkm85HkijlBgPYc7AhPLbEW
         N2yIgN4tGorWV67sSuVaYYybjgEsjcVK4T5OgY/rPbCkp9EdCflujIWHg9axaAR5pWmQ
         uYb4fIEpRCj7EcLIok2Lati1rQeZMUrRvL930UH5AEGvJkLeeXN/N6tUKLUE1JbLt6H0
         g+DzO/gcxB/EEV8yWdoVJU/sVWcAvn13X3PRkwqK/H/2jdalR2bX9cKw85rn+27hS+DO
         aPhQ==
X-Forwarded-Encrypted: i=1; AL+hErEyr8fc8kfjx18EiXsLKb03PF1wKfSreyT1nDP4jLNnQJ07vyuENnv5HoZnBohs02qS7K0tL1XZKGQt8Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z97zjk/Ib7C+O539NGcRddb/WXbrHhPTwFCiGryudMAlAzqtTV5
	hvmrI1GaGt/7To0wB7S591JHCYlMLUCkVh2JradlAyxEN/hqp8vzYa+9gjlU5OKKSH4NVrOoj86
	Iysl5K5wgqTQHC2jlp+Pqn90euZwp1ww=
X-Gm-Gg: AYBFou2A5g1t/2JJqlcyypITTxOHEVBFUZKof2PlA103MYMrWM0NxcOK8OBvzpsORah
	luvey/IWIQ23rhxbLXA15+N4iqAasSMg+przuEAxEBUIzUYS80DXuIZm73KZquSwBv6xVoWhrLi
	dVhfDu0lp9DcH3OTIRmI65JNE1JNJ8UeVE1/Sc750Xv1gi/ruOOA6ORcANkyOk/NbYH2wCEHOGB
	9bw7feOjubfJXzQs3XZ5XSIi1U/b1ym4BkFwhaURQPr0jpwjxT1/f/dhGm+Ap3iZtUwYtzWj0Tv
	fsE4uA0VFcoc8UC+D9yaM4mQMS4725D3K1KESnBJE0gu4ULzH5swnHShHd/iDx3JbChYtvv1hfe
	Qk42HPzPBKkWQyxieOHYqPh0EQ0jxO659LIeWQSyCsydt6U9ANBLl3eN4nVBVp516zFTFd58=
X-Received: by 2002:a05:690e:1182:b0:67c:1eb5:48d0 with SMTP id
 956f58d0204a3-67d895a730emr587688d50.21.1794524470098; Thu, 12 Nov 2026
 15:01:10 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
 <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 00:00:59 +0100
X-Gm-Features: AclHuK_m4BWciMvBzZXogG5H22e1sIVJEt1HWBlLSLAAMEV4Eu9tlsQViR8cFLo
Message-ID: <CAFBinCB7Okxzq0cjAdpynmJb-oOuiYkGaf6w--091_nU0OJFKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: meson: gx-formatter: add lockdep_assert_held check
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 11:12=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> The documentation of 'struct gx_formatter_ops' states that
> formatter's callbacks for enable/disable/prepare are called with the
> spinlock held. Validate this by adding 'lockdep_assert_held()' in
> 'gx_formatter_enable'/'gx_formatter_disable'.
>
> Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
