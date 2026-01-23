Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829791990C7
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769183396; cv=none; b=eG9KYwWSC4o95s5ziSQtzp9PJfKRhjqKMKrG7XZC4ULntgONolWvg7igXqke6E0JPAVo5DRVRob9qv6gaXbjJlCOEFN9UfttxTHsLv2OdN7dWp5tSVJ2620IqIg4Gnhf/tc3JPb9pkiDPJCiGFHrDpvzK9QKzXcAGOq9l9QUdOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769183396; c=relaxed/simple;
	bh=DhTv5FEY/5Hck2zOyoP02+Utk6mDi3PDDODu7TRzD8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WM3Grm21cpX60aochhSk3AmtRQ727XZuqG7OCLNqxHkYsH6qx+C7LndfnRMn4K+GLxl3oWuaSHsiBLh9TIVHuiJQAk2EMhq3yJ419g+72Xtiu64ofmESI7CXNw7LFdCNRdzaUXV8aDhTmcYdMRQ5IqJuneC/O7DjMXUlpMbJvSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0eua0II; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0eua0II"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d122733808so942291a34.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 07:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769183394; x=1769788194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ofzvC10GdOoW+LodGk5Ah4MZKisvHYlAnV9C+wNMtXU=;
        b=J0eua0IIbiKtX9rDvq23iE+DWsbu8S7sAB9nSnF8eTQzE8RhPUeVTrtNqJxtIpzjOy
         KKITBmWWflgTFaM7Dwfvmidc9EvtgEL3hSLpryI5oGWUulvFqy2B+OSeFJHuPt8gueyF
         d9K+27msyuJ9MXaIRReX9tCLIL8CFlVgAfSJXV0LgCZxs98oqY6DK8lXQITE2M0yVuVs
         UdG7Yx2+741QgKZFsFyzApElnuIXVpjFAg+PYF23Ma80n+LtXAtcVpA8YUWLVJ0fvZ6r
         +JK2GmcES8IYgBucoArS5tf2JmzHUysAtZpsxiFrM+m2qmdKnCZINuKINtL+x3Oi/kKa
         YWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769183394; x=1769788194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ofzvC10GdOoW+LodGk5Ah4MZKisvHYlAnV9C+wNMtXU=;
        b=KfPshtwacVP9gpE04RSpkgDHlO0BabCrUONjX+Fr3BmL/NymuE5oEpN4z1T4OU5E+U
         3bnfZxC9xGWQ+WFtsbAkvxp4liv83Yn213gYk4uKhN+YsBqQ/WohfWnNqxK/PUxKyCTH
         F9xV0fntexL/c3uT5BjoMI2Desz12fraWcGjtYkCv25Ha2r+pUPBdULhibzUka0MJfeZ
         5wrtEh+/ZXa5SUyR8RNrPHQ6jEkqvBkQdqO1StG1CODhKOutAZ7vow1aSmkdGI1icOlM
         tWV+8dJUTOooINfrEHWwr4ZBHADwpzKOFVnptJRWM+ooidd3/EPnfbW/Zp523/20kzRE
         jMvQ==
X-Gm-Message-State: AOJu0Ywgc2ORBVTliv8EVXD6JyD2zznOJlmPDmjMQay9kkerBbBwdO5h
	J0+btnJYxCXOT34HN5/Fz5TI8rAdlOybslfMs7Szl3r4SWWgIVihaTfxM1pZoQ==
X-Gm-Gg: AZuq6aKrX6RgUWe9XsKzzYjGCr48pXNCFflAqH3Ml+yyiD4qv+ADs5yzNyCRDaZ8KNW
	YhGjsDzeHMP1nv2HJTzQpz2DFVHu5MwlpzqLZXnaiIhZHsVhBonUuVlB/d6Ts+DKa8JdXBi4FV3
	2PTOmC55e1y1+sN6vClQ2iI/UlZqHOPBWA9sEFId83M3E+nb4H6b59iXAXhO1W5Zb2E8eqghQ90
	ZKsObcAGZTdUvQq5Mx1mPcFC86YrHKSwPvyGHjgIVwvpzYa0ScuehpFExz9r0nJBplEsXqJL6g0
	FnVsIQ3f8EFuf80OSrT5YW5iiNaUbZ6WH2J0L9BJFOzdnQB66nWYFdijnWk83Bug5Zp8BWA325u
	+8jFDC3a76+6oder2Oexd4NhelfdZUX3Cs8x0LvYLYCxinUoqhLUi3O2N3u4GLHOlUYuM1LiljT
	Z3nEuC6akXoQ==
X-Received: by 2002:a05:6830:6507:b0:7cf:dcee:3db5 with SMTP id 46e09a7af769-7d15a5c9039mr1619776a34.1.1769183394195;
        Fri, 23 Jan 2026 07:49:54 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::ffa])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d15b3e2789sm2074327a34.27.2026.01.23.07.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 07:49:53 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sound@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	wangweidong.a@awinic.com,
	tiwai@suse.com,
	perex@perex.cz,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/2] Anbernic RG-DS AW87391 Speaker Amps
Date: Fri, 23 Jan 2026 09:47:29 -0600
Message-ID: <20260123154731.130649-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG-DS Speaker Amplifiers. The Anbernic
RG-DS uses two AW87391 ICs at 0x58 and 0x5B on i2c2. However, the
manufacturer did not provide a firmware file, only a sequence of
register writes to each device to enable and disable them.

Add support for this *specific* configuration in the AW87390 driver.
Since we are relying on a device specific sequence I am using a
device specific compatible string. This driver does not currently
support the aw87391 for any other device as I have none to test
with valid firmware. Attempts to create firmware with the AwinicSCPv4
have not been successful.

Chris Morgan (2):
  ASoC: dt-bindings: aw87390: Add Anbernic RG-DS Amplifier
  ASoC: codecs: aw87390: Add Anbernic RG-DS amplifier driver

 .../bindings/sound/awinic,aw87390.yaml        |  34 +++-
 sound/soc/codecs/aw87390.c                    | 176 +++++++++++++++++-
 sound/soc/codecs/aw87390.h                    |  86 +++++++++
 3 files changed, 283 insertions(+), 13 deletions(-)

-- 
2.43.0

