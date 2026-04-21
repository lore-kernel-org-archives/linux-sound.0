Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC55E19D092
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 02:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776738635; cv=none; b=d0DgIDpsb2JaCx5OFWauh4e28wr1OlCjaUJQmh9pempumrlT8vsfPGAfy8yxKfXHYwHjhOqw3Kvz5O/OLL2+GjfJr9XOFURcxt66frOjEqf20U8LB77rYDBLEYB/OWJwCActyeP72vYrXjJvtlTipNdh40S6CyjfmIcjACGevkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776738635; c=relaxed/simple;
	bh=eNFJhBtjD8B8eniLaadq2Ors5V5LvMspGxmHlcuetcg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=jDs/TMcWZz0m1KcLajQVS+a3WILrq1DpE/xJHJjoJt0nEp5QFHHllA5kcHdJTvAhfIFPoJ3m+bl/9hqKrD4cfvh0gG0+MjH6NT0U4+KgVusxsEN4RTi/spf1IK7n1lm6vCUo2DOuw+yP1tFubeeICAY/ItJEw5p61Z6KOy8ymLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NxfxVh/8; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxfxVh/8"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e4989dacdso3969229e87.1
        for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 19:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776738632; x=1777343432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2IBPUNENCsQHchUp06VWORQgbouIwBJadPc+eZ3RYI=;
        b=NxfxVh/8P3yJ+R8AOiDoiuaaALdCUcQw/FAeUEFGIpTZzA2Z8uJlse96zqEBAq/zNy
         EkPfVSSKAOlF09TP/0YhXwosRqaSAMgow23YZ5djRfdR1TtobgTejty/ZYlSWEffJsY9
         oasWK6bMkqlVrO9Zqg6hCsteMIZgEBnIkdhBCNv1esLcrH64veu2txGp5gnoRgDQZx42
         GM2i/gNwUTllMMxGxGVb6lSbgWLc2L6vmblgqVJp6h0DkaKUklZ/lPShOnI5Cw1uMx47
         FAqT1JPmR1eLkKLjUKjHsERjWHadRKSlK47dPiK5yKiTRxCleKe/uoDdMv5hRpO5UHKT
         /+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738632; x=1777343432;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2IBPUNENCsQHchUp06VWORQgbouIwBJadPc+eZ3RYI=;
        b=YiLbzMYsY/8tH1LOm0xprBcyYbr4UId9rssyYq3cyLjALEwRsWbrM29jas+EqW06Dx
         6ikWPENDnBUZPRfJuvix79fvLFEe+7Sh5aGctxAluK2LujeD7QIyLYNaK0AFcUwubEFM
         4+qymhGYVUEANeRSd2hXW/NKt5tWwhi+YNAtBc0AsHL5HwrLCBQ+5bTPQw7qBwQ0wTRP
         eLfkt4e9WyL56PNKowRH/+8mDo3faNmoGo6KlP+YptKZKmNdz1HJDB7FHsKj8q1uciIt
         EPbIJfFF8Wd6YpFJ54QrDGMJArQ7Zm7+YdJ7m6IMqtTvip9UXs8TAzOeCx1Lk4VJeIqb
         /JSw==
X-Forwarded-Encrypted: i=1; AFNElJ9/hdaL6QBkKr6y4fiVHhJb+IpaiyXvpcUMGgbSyL7nxhpRZ/f3MKsZEHDxkPcnhVZQVr+c+3vEY/2bbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXMw6Ba29/flN2ydGU0wwJ77Ss2UE/gmV2dHe9YicrQj1Ev0ZA
	gCIqUCS97xrVW/uTIJTVgUSZSoTCFY8177HeClWP5D4nV81R0Zn6Eu/r
X-Gm-Gg: AeBDietKaQ4QxP02o67RlCIvILjgK/091TaPfDK2GdPxNN48QU9vQFkOYIJA8zOGkb2
	ysPskKeeJBfs8fVoFSipRE+enSZfy3vcMd/uCPY0mGI/KW7/zEpv26HLFL+2bXMYgMz0EKtK5AA
	Y9UVFNm/rt3KDEoX+/ZOCLjN3WqwQv4v1BH+/E5tx5p50ESDtCBXZNE9202NrAtSnN3syfym1pA
	CPziaPlLiegb98EjSeq6ufsV3lNnhdyNep1/SbzWIUb0Aal/MBtH7aqP50qQ5SzEhqAqVXomTTb
	c11VZdpr73UZH6BI5ntCz8YhHHlAz6cUIl4d+aGcoHdNDQir0MJA5dYOQ10GACeWU5+YXR6gZtY
	nZIWyvViAlTNInEmHiZ9d/HPrrx7upCW/JkQALyVgtDofDiP1rMdDVqSnhSyfH5VI4BEkHsmGyV
	RJRT87YXQIKCHsoOZwCDzIXIkyCw4Nmte6hbGRqoKRRmAmLYRwl9bx9UzUglrbP+4K4RgLgkqF3
	GmFckvVG3Iqx2Ms
X-Received: by 2002:a05:6512:108c:b0:5a2:c962:59f2 with SMTP id 2adb3069b0e04-5a4172e1c03mr4555045e87.22.1776738631665;
        Mon, 20 Apr 2026 19:30:31 -0700 (PDT)
Received: from ?IPV6:2a02:2698:242a:1c71:d5e3:307:560c:a869? ([2a02:2698:242a:1c71:d5e3:307:560c:a869])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebe3dsm3307460e87.74.2026.04.20.19.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 19:30:29 -0700 (PDT)
Message-ID: <5ba3d073-c5fd-431e-afb9-0a0911300aa7@gmail.com>
Date: Tue, 21 Apr 2026 05:30:27 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: IRRatium <majnkraftiigry7@gmail.com>
Subject: [PATCH 1/2] ASoC: cs35l35: fix typo 'overide' -> 'override'
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, david.rhodes@cirrus.com, rf@opensource.cirrus.com,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Fix typo in property name 'cirrus,classh-bst-overide',
should be 'cirrus,classh-bst-override'.

Signed-off-by: IRRatium <majnkraftiigry7@gmail.com>
---
  sound/soc/codecs/cs35l35.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 7a01b1d9f..7d9b42c5a 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1311,7 +1311,7 @@ static int cs35l35_handle_of_data(struct 
i2c_client *i2c_client,

      if (classh_config->classh_algo_enable) {
          classh_config->classh_bst_override =
-            of_property_read_bool(np, "cirrus,classh-bst-overide");
+            of_property_read_bool(np, "cirrus,classh-bst-override");

          ret = of_property_read_u32(classh,
                  "cirrus,classh-bst-max-limit",
-- 
2.53.0

