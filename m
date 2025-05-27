Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432D019DF6A
	for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346375; cv=none; b=oUgLM5R6P13Yb7xGWP13ildBo3ZzlapD+efCK2ct7398oYT3SY4y5Hcj4+unAckboUET/N5qE121iLZCPtDunGpotDKYlH6wl84jC0Jgd4wgxpSZDHdkX6diEvdmy6nyQrAa2qBHO6PPSisoVuf2io08HVr/zgA6i9MqTWC5jps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346375; c=relaxed/simple;
	bh=hZgsNJN5U6euHAUZEHEmUPgEJHbDN2WW54ZAPUUNn8I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Zq+oeceTBaBRGcpKV9PXlyalmOuPA3po8rPZOpsnONHYN6iQAKWL+u/NLbmnXF1w6bgELHokGH0a87aUYtz/c7jhjw5meDhzEqjVuXsfgwpQdvSYiQ4WOp8zQAEdIdWssW2pftXprbRN6w9DXI5pjAm86BLPk3FTGu494J1QWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org; spf=fail smtp.mailfrom=openpixelsystems.org; dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b=zhWlcXvX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="zhWlcXvX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a36efcadb8so3181812f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 27 May 2025 04:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748346370; x=1748951170; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZgsNJN5U6euHAUZEHEmUPgEJHbDN2WW54ZAPUUNn8I=;
        b=zhWlcXvXXbVPPhRC9534eIKWVRk0AijQqeFnKb5xZRtuhQcxN4dUpjyptiYYWxGdW8
         OZ6u7m3mWDuJDik2DK1VEEfhGtC2jOEjzN2LS435rYvaOJTH4wkUNEVRodpMRTx/x4K6
         DwCQ5TWyrNSY9KX+rvj2ylsPsKgSun4znHnivkye0OjgldDLOEem5IKQT/eVesc7lPHb
         LlV/HQMdbdUzXNPMqpQr/gfb7NetSeWSXMy1OcuyRszaSrFL1g+R3riC6nd4AUXEs/yJ
         YdN4vIedFilyvFPJe56hC8KSmk17QjJO2cFoMt1pkkKT/DbNwmMnZuHiLE5f8UATauB2
         Mmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748346370; x=1748951170;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hZgsNJN5U6euHAUZEHEmUPgEJHbDN2WW54ZAPUUNn8I=;
        b=pPMNrgOHT8kro25P4T9VxnDuahmrpPNxJ6gcLo8hPEwqhDTs24VZkMY//HJvEfHsAF
         EmeVSljyNIPzebaE82diE4NDILR8GWjqOi1q6AAzsFoUE0UK9cpOY0gEgtdR/b1TwYBV
         +kIioqX8HC8HVftOlkOZNa6cRoEORzioTXbTgHfQBMwR2fvRLN/3Q9PZnyb10Bg+LGEl
         rXlhc3NzGPbtvZo0AWbELuzRXy26jBuVE899zbpamk6C0tAVbICwONVykoXtSgBPizg2
         2+e8smlI+ZC9RvN9upC/Fw80Iub/PFVZZ6AHWofZIM+3vD83gZQgUHRKzV9q6hw4lfTM
         grTg==
X-Gm-Message-State: AOJu0YwBBfcuDy4LKzHlpQW90cuoA3GWdJxC5gjvvPAUIcA0+1CFSx1b
	MS0To8Fg9Ob9sZaI+j1ZEgdgndYNnrEy5PpxLepQdZawacj1zcZOa5IyYnnA9JuyWt8=
X-Gm-Gg: ASbGncsLoTWWWtcSi69JgiedYLz/1P8D+cL6kNB6jB+Mf8Trc/nHBofQbt/YO72s2wt
	OrSholUpK6a3VVZndvWjzaQBL04GrWBrRiQRjhvaFRMFYmMEIRgpNJwQBgKe1iVtCxYoX4A1Ku2
	02ofogcreeW0NEfLipium1R8oGFkmp6rdJULvxiHeXkaP8t2CMgG03Gl1g0jV0msVNISSX406Jn
	2E75SF89Etmz2/Ob/kY4LbA2EzANGjvcWw5Wq/U6cEHTNVcjVKiZ4xk0OC/wcJEKI5KITJVtUtj
	UxP9e//Aq3WbtAD5yvOefWGgwU5DxAh5mSJgnG4+UF1e3dTNnIB5SefhKn2ftCH8pj/sM4NR1yt
	NUlvKBcOvyZSmVuvh9Be1cJkXjdGOzjahEtxk3EU=
X-Google-Smtp-Source: AGHT+IEJksL9yUy4jX+PG0AKVXuGsMzofM/R8YjCchkDDQuXA/zsN6zJKbbWLD2SqIYtzpiCCZu9+w==
X-Received: by 2002:a05:6000:240d:b0:3a4:d6ed:8e07 with SMTP id ffacd0b85a97d-3a4d6eda68cmr5840366f8f.32.1748346370483;
        Tue, 27 May 2025 04:46:10 -0700 (PDT)
Received: from localhost (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcced4713sm17270135e9.1.2025.05.27.04.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 13:46:09 +0200
Message-Id: <DA6X2A2JC57H.DK70D9XL9C8Z@openpixelsystems.org>
Cc: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <peter@korsgaard.com>
Subject: Re: [PATCH] ASoC: tas571x: add separate tas5733 controls
From: "Bram Vlerick" <bram.vlerick@openpixelsystems.org>
To: "Bram Vlerick" <bram.vlerick@openpixelsystems.org>, "Kevin Cernekee"
 <cernekee@chromium.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, "Kamel Bouhara" <kamel.bouhara@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20250527-tas5733-biquad-fix-v1-1-0d3d941700bb@openpixelsystems.org>
In-Reply-To: <20250527-tas5733-biquad-fix-v1-1-0d3d941700bb@openpixelsystems.org>

Add Kamel Bouhara
