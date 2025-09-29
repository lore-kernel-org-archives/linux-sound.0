Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B93090C6
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759161075; cv=none; b=kLWoOiEk5j5OZ/by9ae2RC+c5Tb50z4PnqWr8XmTse07ROzh0EVq+YRa+ADoMQHnCT+/pV+pm4PdUpsfpUkRUvnjRNIPBM7wHABzXTN5nRXQ4R/D6jR2OxDEGudA2dISTJ7ogWAMblR0M5J7gAyBhw5eKTRJjT4bHVHC3LbzA+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759161075; c=relaxed/simple;
	bh=Tn7Lo3+MVMa+NDx1a7Lew08U0+v/Abc1J+SDk1MBPmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l1NoPF2E+ZpNYsjw1zMqXgpue3pveTuuiMFsWc81Ec6p1IgA4MaW5q+AscQzAJGojQVW/s6S1BONKUSww6TCaiSqXa+vP/QFD2xSDzpcma8aizGW6bC4OB1c4bLHjJWCVySIwA/gQArk+I5bpqndrD31X5e1KQ3DmNXYcs10j2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EK1wEa6/; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EK1wEa6/"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4060b4b1200so4419154f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759161072; x=1759765872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pcew09jKjUyvWpcIkwlST2MlTw3XL0++9hS5NHqcowY=;
        b=EK1wEa6/a8fV+z41shO3lOPy0nAhwwJiK+664D+tqw1anobodEvyKQwNvWi3atdD5/
         D+ZGr9Hw+EYuyvWS28X65LWpFcDGi4FXgRKeVQakDGz9kNsZ35snjzl3jXRKqaiS/Bho
         0dAEyVRhor+3DOEgIN3M5n6k37Yk5VcN9WFPXYD1WRNcJIYUlUNMK0QkFjMwN0HnkXkV
         WHhZK6nVfbalbKx/NuxmhKaVQOo3jEOFYK9p6n1Bh4U1y37lG8kGttKjpFMryn3h1ywb
         mVosJJl6ryI00mRY7HXeiIRcRc3X1VkV7NpGy7YE7TBM6Kqy5KveUuajCZkjGHYIXPhc
         a9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759161072; x=1759765872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcew09jKjUyvWpcIkwlST2MlTw3XL0++9hS5NHqcowY=;
        b=AeOZUzT5JaC2++NxXsSxOvGyQdAGiueUaaLku4y3hPHmuTu9rV0DEqjPmjidHPMUZK
         aBM/9qxYtcVwdTnT9K9Y8djJnOB2/ujpIv3EkV/fSF5UyQZoCm2rFF+B8OUmsbuDqQ5+
         Fk5kl14O6AVsnFdDxuGi2ZP8fX3AE2m12y+9ndi9jVDQL7Z9jr6O/dzFEKyPvzOCKyG/
         4/oqqbJhUS8XzeeNt9HZ86150L9+LzXKwxQBC7sPos2fGfqRwUVQJlkI4zPvjyYa6bB8
         2DI8YYl6STw0WLXdqD9Od5g3HhMlqf5QMD546i18eL+HK1gOZ1bQiTa3km6Vj4Fo3GKq
         MeqA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9v143F9M/oySqUd1Nas1E4cz20CzEVb1dYeAyEvms6Rw5vyYqXYA94RtEeVxvQXZwbzmr8+cSDk53g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWjKzfF0NpOhjyp03qy9Q+DguDSn8QL62WXBnz1qpMo5cLHKQ
	xtlis6Ec+Qs/26gbVAGF6tBymh1GoOZDwb/EeEkKbLPXYlPCh21UxDvgCgGyY8LdAXk=
X-Gm-Gg: ASbGnctuO3c5eJwgQscxAJyyFfFJWpntr+GGkI5p9fhHFkcrgSSiqjIuDimhi5avn89
	KqFaNItb5TZcp0i+7dkz7DmvgFTmGFnnuSx60X8hcYtO/xr1SURUHv+zZYkSSScVHik+dSn4oxY
	CABH6x/0tTcuNh1vh+c6GOMgxUSbjxuxQOoDklNKQDVjKrFzd4TOpCVX25C54NmH6EDs5SZaD7U
	S0f85UmgajiceZnFzEpPlRKi6y/w0RQ80aunLwQ/qBnf74XFK9YDT0ddZcASVH4tYToYAeLkpHI
	DKSbY0LY/nk9dxJmi5SY2vGkmwAef71V9p9bRcz8gfXAIABKqYEMTqBa5wmqMhGiaPMGNwwsBFX
	lQUI20f/VYnJnQ9Z63og0kisNfc0w8BHGvQiLDBfjgaaRkZCc
X-Google-Smtp-Source: AGHT+IHgUtglBKcaI1fh2MKEqfN0IsiySNMd/H6eZ5HTDRdue+BInEZVwgjETygJVFyyH4wCmjUwSw==
X-Received: by 2002:a05:6000:240c:b0:3fe:efa8:7f1d with SMTP id ffacd0b85a97d-40e469db7admr14459172f8f.7.1759161071680;
        Mon, 29 Sep 2025 08:51:11 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4151d0ae6f9sm14328581f8f.51.2025.09.29.08.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 08:51:11 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/1] ASoC: change system_wq with system_dfl_wq
Date: Mon, 29 Sep 2025 17:50:52 +0200
Message-ID: <20250929155053.400342-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

Below is a summary of a discussion about the Workqueue API and cpu isolation
considerations. Details and more information are available here:

        "workqueue: Always use wq_select_unbound_cpu() for WORK_CPU_UNBOUND."
        https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an isolated
CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

=== Plan and future plans ===

This patchset is the first stone on a refactoring needed in order to
address the points aforementioned; it will have a positive impact also
on the cpu isolation, in the long term, moving away percpu workqueue in
favor to an unbound model.

These are the main steps:
1)  API refactoring (that this patch is introducing)
    -   Make more clear and uniform the system wq names, both per-cpu and
        unbound. This to avoid any possible confusion on what should be
        used.

    -   Introduction of WQ_PERCPU: this flag is the complement of WQ_UNBOUND,
        introduced in this patchset and used on all the callers that are not
        currently using WQ_UNBOUND.

        WQ_UNBOUND will be removed in a future release cycle.

        Most users don't need to be per-cpu, because they don't have
        locality requirements, because of that, a next future step will be
        make "unbound" the default behavior.

2)  Check who really needs to be per-cpu
    -   Remove the WQ_PERCPU flag when is not strictly required.

3)  Add a new API (prefer local cpu)
    -   There are users that don't require a local execution, like mentioned
        above; despite that, local execution yeld to performance gain.

        This new API will prefer the local execution, without requiring it.

=== Introduced Changes by this series ===

1)  [P 1] Replace use of system_wq
    	system_wq is a per-CPU worqueue, replaced by system_percpu_wq. Despite that,
    	system_wq in this change has been replaced by system_dfl_wq, because there
    	aren't per-cpu variables.


Thanks!


---
Changes in v2:

- Removed 1/2 from the series because already applied
- Instead of rename system_wq with system_percpu_wq, [P 1] change the workqueue
  using system_dfl_wq (the new unbound workqueue).


Marco Crivellari (1):
  ASoC: replace use of system_wq with system_dfl_wq

 sound/soc/codecs/aw88081.c          |  2 +-
 sound/soc/codecs/aw88166.c          |  2 +-
 sound/soc/codecs/aw88261.c          |  2 +-
 sound/soc/codecs/aw88395/aw88395.c  |  2 +-
 sound/soc/codecs/aw88399.c          |  2 +-
 sound/soc/codecs/cs42l43-jack.c     |  2 +-
 sound/soc/codecs/cs42l43.c          |  4 ++--
 sound/soc/codecs/es8326.c           | 12 ++++++------
 sound/soc/codecs/rt5663.c           |  6 +++---
 sound/soc/intel/boards/sof_es8336.c |  2 +-
 sound/soc/sof/intel/cnl.c           |  2 +-
 sound/soc/sof/intel/hda-ipc.c       |  2 +-
 12 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.51.0

