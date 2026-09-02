Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDE23F4DDA
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338824; cv=pass; b=VW63fZApmMr2tSOPoeyd6rr9gjUebjzhPfNrVPw2LHOk+MwUmMy7xGm3Dduhmu6k7kpEh9CPU7YSYSFvfl60e85QbgD+ZeNZPvYcKiEXnL9NymHAVhlh6MIAi37Lj0UpYd9SElWugJSRT+/bSQbbEqLQvaAetwqJuuwEzmOhHSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338824; c=relaxed/simple;
	bh=shO5HETr5DbfaWXJI1Q4VSUgAkN/OetfPGY1PI6GuMQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5Eehwhm6TR4AojLlvaQ/k8d38Q+AsgE7kFB6ITZlbiMw2oKKYgIoBVUPzvflzn4EF0jY8xzX/AWFxQnBct5/T1jix6CfcAZU5C9xOPJgqpJSDZfB1T/oVnn7279Pjo8/zyXBaBJ4ozxNyvpFP57VeUE2LNYqyYnK2nv3BCSib0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohKzGM/J; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohKzGM/J"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b396d2fb9bso420638b6e.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 01:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338822; cv=none;
        d=google.com; s=arc-20260327;
        b=rfuAHbql1csmI1GqPqT5Bd2VURqQMqvwGl1eZ7W/1irz1QTIycZgNVH+XKJcoAKFI6
         9ONmtP6EC3oGj0PfuIkPCH0d9Hser6gsW6b08DdRserX02IMQGl+7heWj+hid4mLmJGZ
         eY5dcF2kQftFMm1C2kmXNXfdO3O2ZIH2NNxpp2gdsXBTzEJ/iI5ET4+Zi7mJwq2JXkeA
         MpO02mMdyUJIqQPGHCZRPTcRmxlKMB8UZ4BCLN+TiG7tX4z+TicpZAMEubAKek8za/Mj
         QzNUAY04wVGWzxix5vT/USpmEE7KTiqv8+gwbkgKGQe6bWLWBVDWRF2chXugLVm5T6kv
         P3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=cuO0Jr/gtOURsAL8f5kx9fAuPpQ07Nu44mKm8vGuGkQ=;
        fh=PJJD9T64N6HFGZX3OOEU3YFtZiC/e87QiaVv4UF5cL0=;
        b=kYqznNdHjo9y54CFBY4MywhZ4WXf3BgdPza8OyLVJtqrYsGmgeHuAYM6E3wKCeZ2ai
         Af6UP9HKXuTiHJyuxz7RJ7H35X7Su54BKPHSVyH1Pb6J6jGTu/nnf66V1xDTWs+nE0fT
         hm+JVxULL5j+OIMPdnPmXskaCd0IrGZWppoYtO2YPhJMjeoLvTUduUDCS/QJ81HnfL6v
         EFIoiFnsmy5/LGWg34efdpVEm6Lw1+43KlQbUc6bxFDilB66pLWYBmjMwrdt/orq/vPy
         wOACSFdgfDufDSkRygBN629eQJVFR19fMcB9nc9NFaSiNcBpQ9dYcQcO2qyvRiXgL1ys
         qL+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338822; x=1788943622; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cuO0Jr/gtOURsAL8f5kx9fAuPpQ07Nu44mKm8vGuGkQ=;
        b=ohKzGM/JNLc2nRmC4KJjEyPk0O4fyqSL9l7dUL0cn3Kv7xIidA06KC5irbrrW6m7JR
         E08QXvkkX8QeOs6arIbCPkgASwrTn0dxErnwZ/Q3PffJbfkZjS4JGM3mGk/b20Lj9K8s
         KDRTAxB+N1eVq2yR4qHQ6UNxv2VNujGfKcQhVChzUqe1zRBonx5zpzLS2OEj2J8DSXGv
         plHgUujcl6OeHu6K0Dx4+VoXIxrKdX4wAcCmzHR98uJ3eTEWBfjeyC7EsHkNCBWNuCyo
         X6qGf0JKSDk7EomgG1yJ5Gnj6q9NWWR46UIi/1vGA5sDE3khmrv/WY4VRDGHwRS+1WMT
         9r8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338822; x=1788943622;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cuO0Jr/gtOURsAL8f5kx9fAuPpQ07Nu44mKm8vGuGkQ=;
        b=izmOOQNsP7LXhdC6Ttvb6wb/XDPGikFrnI6lHiUtZNQhnlTvA0+JjAluLqJ6z2JIoo
         3NaMJE2IGqDqid8VoGHDvPC9cX0QKGbXS/R6JcJpQaq4tq8tDuL6UtCwLcrRF1C72ErL
         zFhewdpEPSypeZoDO2wiszIJWSJ3PA4uOi7e3bHg5L2Uu7vzinVmqSR5rj1mEjowhPdj
         WCOyUgAdgwoDFECsby8znv4ap1PHVOlmvNvpfVUm9M1FRX1FJ5Is8bQHrHIc1BIfJ8rf
         PJ0iH4oWvRn38jABVDVBwsLnbnR77UHlR6gjwrwREXY9/Ed3S0HVEBC3VMe8mjYXiIYI
         NdwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkRp/FRWhc9c5VNGHpDm3ofbWaJBtRJue/LHEbHaYWhr3w6L5MfdF1Ae9amsVio5kpeksApLpwKYctsA==@vger.kernel.org
X-Gm-Message-State: AFuF++lIRjNouWZmtv3I9dvjTDOE20Fd/e0jsCZwnJYjLCfUWuqZ6jIT
	41pWR89vvdkyoNolyUMeuJ6/L1cHsz0gQ7CQmgcgpd6hOR42EBAR9GkvAZAdoOETiHWGkuOtnA8
	o9+Tm7zCRTWm8bE7UVlU1Pikd60H/kKk=
X-Gm-Gg: AR+sD11qqHLcQ8bsSPaIKne5dOIgQsuetERYxWZD/MWMLGYHnk4i+0mk9uSNaiWaUWs
	l2Rdwwr2N6gs8NHI5JJxOYzZwFtUI7cfEutF7g5Z9yQTf0w5juKlEWOvWxxuOWBqw2p53dQ+Do+
	tMkXOm9pMv5qa2VQv5Xdg6VxL0YBiKo0b3MMLtAuTRXWQm3BkZoqHmUYtZOdC1SPB3ZSzarVtvN
	Px0POuIMnLRpJrCgb7sd5USIpaKM7qxGMGEo+YnwVRZaV6PBD3nhTqdAsGJ3UXOL5R+fFloFlov
	a+oqcsQVoP0gKrCcKZufBStcNJSNdAbKbb2ZhFwjtdTDqR2Edx/oIRr5Rca5iXwlCvZUtg3NXCt
	WzavhAkULKNWk24QTOcQXWb0=
X-Received: by 2002:a05:6808:319b:b0:496:fd2:94e8 with SMTP id
 5614622812f47-4b6be3fff99mr2617954b6e.12.1788338821816; Wed, 02 Sep 2026
 01:47:01 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 2 Sep 2026 03:46:59 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 2 Sep 2026 03:46:59 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <83d7a9ee-e164-4f02-b83c-31be3fe43fdc@intel.com>
References: <cover.1788286335.git.mauriziocasciano7@gmail.com> <83d7a9ee-e164-4f02-b83c-31be3fe43fdc@intel.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Wed, 2 Sep 2026 03:46:59 -0500
X-Gm-Features: AcwNN1WJRSqNP6P32x2PdKxr7ToQynIucjZmCF2cFtsls0iFeuILKt6LVe8i0Fk
Message-ID: <CAO7O_xi3Zrxc7exqP__Ua61dZUF=OpNvi6WLxc9A1sPG_z66kw@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] ASoC: Intel: Add Yoga Book RT5677 support
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com, 
	yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com, 
	pierre-louis.bossart@linux.dev, perex@perex.cz, tiwai@suse.com, 
	jekhor@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

You are right.  The statement in the cover letter is inaccurate: I
conflated "not revalidated by me against this revision" with "not
validated on this hardware", overlooking Yauhen's v2 report.

My testing covers the SOF path on a YB1-X91L, including PCM0
playback/capture and PCM1 deep-buffer playback.  Yauhen reported testing
the legacy SST path.  Those are separate test results, but together they
provide a basis for advertising both mutually exclusive firmware paths.

Narrowing v6 to SOF only was therefore an overcorrection, and the wording
made it appear as though the support decision was based on guesswork.  I
will restore the dual SST/SOF selection in the next revision and document
the validation of each path separately.  Yauhen, please correct me if I
have misstated the scope of the SST testing.

Sorry for the unnecessary churn.

With Best Regards,
Maurizio Casciano
