Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013017.outbound.protection.outlook.com [40.107.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA8A30EF7B;
	Tue,  9 Jun 2026 02:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780972905; cv=fail; b=l3EZ2MZVSnKSQYAgiS6cKhZqkMDFZCo+9+LX/sgfrRTGA3VRUZb/wqaHCaPOoYXHFFBIxkkRtLqbn3r1YfMs4fKTcI3oi5RPm3PZj6fA8V+DX7JdPbF0exAK7Tfl8Xc1bp/ZhGCQTZVeGi5GqM2x7NJ4pQHJ6G8B+IFhcJmyHoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780972905; c=relaxed/simple;
	bh=I8uJ0mLkstOn9stcumPM8/bbRDjkVLsrxBjcKjGfaXM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kF7nJhe4lvKcbEyuFxAl8txgHAJgJPoIIi36aIz8DR6M8+Xryvn9Rt/Y7lgSXeiIUZmW9jguPmNYiBqjqZogL0RJFnExWEMsdOow4WC7wtcmxTfg3KvsbI5pbZkcDstXLzBpOV03C4oz3UDHIHaNRGMTl3GLbfXu64IXQ6KSDgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com; spf=pass smtp.mailfrom=nuvoton.com; dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b=HoY79dsq; arc=fail smtp.client-ip=40.107.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nuvoton.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nuvoton.com header.i=@nuvoton.com header.b="HoY79dsq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZ695fiFuVwvBw+MEfiKJ/GZrYjbAHSaa6Um4zWQikWjYOpEuTtdNQREjSljmvae4fat4lJxgwBBI6t4dIPLNNfiGEfsaROv7fC2LpoNfeAAe60f9mrbkZpIk+R53kbTWMRQivVV4QriZDt80M3YMRypzpXxpsaFMBnFq9Vkp7+f4+kyq+xtsiyGBBTQo5t89Mps9fhOYuRMFWCKVKHGXwZKO/kW3VzOuGvytZsOUVTD7vUPo8wUWNgaQv0oXMPA6iJj7sPDrQv40rmBrSPF8UsVfnXdsi+7LA6FZS534IIyxuaqfpzvjx48sRzqfysqfm5+IOKp6WPPWCafk+sbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFdWTZBK3no0KwCVx5mHI8V/kSHRLCjwtRAzOSMLOJY=;
 b=AmEEHDozvDLhVEyBtKdoMXt0q4I4gy9MwImHTXYxVWBL8MUUwgdA/pG0b5OD6XNsYufLn/fdsqPYPKHKuwKIM3j7MdF5MoSmncRYNw8xLO/lyH4O36STD70ct6n8fsnhktWgJqKLTH0ZgkoziLP5aZxq5wLmsQZ4zibcI35NWY7g5Pawbwi+/0bRtIsQQoX3u92qwBHSKsQSzDkexaqX+vgIoR1BZ2kpIQNNDy80OM5psUukJR61KmpSexoNuBPqZT2o4jDkH81DbfHuh/i1x/XFKu7XkJfAHPJTfwrOZjSKbF6LXqApPgpE3WZjbUf4oXSNKjL3Gvr1cn6Ao/l8RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFdWTZBK3no0KwCVx5mHI8V/kSHRLCjwtRAzOSMLOJY=;
 b=HoY79dsquqMqhETDVgCduPmVaPCSa1EakBAts79CrdIYIvAbB3iq6AiednIBnSsZhL3Au1NcMalerQF7uyYsZZnLZXSAsQbGXnPloIoSUe9t3QK1RiK8Eh0g7MI1bZITaF2kfjAHS1US7LX31geIN8e+0MuAI9kV+7Rqi25YvnzyUIZcOvtwWkv841QA8TMdnqMbrPA4EibqTjPscc+r+RJyOIgvHNNTiy6ctRr+BFRIZqlB40cMWRBfXXFIRcCcvSoAlZAbzlYb6VIj2bWzC2S3fllqrwWKL8KGYuMM2rWgkk5zmRHDNAhqKAU+y8lVP7TYMkttFZOTpccS+IlRaA==
Received: from PS2PR02CA0081.apcprd02.prod.outlook.com (2603:1096:300:5c::21)
 by TY1PPF538CF1BBD.apcprd03.prod.outlook.com (2603:1096:408::a57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.10; Tue, 9 Jun
 2026 02:41:36 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::7b) by PS2PR02CA0081.outlook.office365.com
 (2603:1096:300:5c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.12 via Frontend Transport; Tue, 9
 Jun 2026 02:41:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 02:41:35 +0000
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Tue, 9 Jun
 2026 10:41:34 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.61; Tue, 9 Jun
 2026 10:41:34 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Tue, 9 Jun 2026 10:41:34 +0800
From: Neo Chang <YLCHANG2@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<neo.chang70@gmail.com>, <kchsu0@nuvoton.com>, <sjlin0@nuvoton.com>, "Neo
 Chang" <YLCHANG2@nuvoton.com>
Subject: [PATCH v4 0/2] ASoC: codecs: Add Nuvoton NAU83G60 audio codec driver
Date: Tue, 9 Jun 2026 10:41:26 +0800
Message-ID: <20260609024128.585938-1-YLCHANG2@nuvoton.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|TY1PPF538CF1BBD:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a90a652-55a3-4b06-6e00-08dec5d09fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|30052699003|82310400026|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	7wmaeRwd1Fim/KYrkiTHL6T6G67+aYY3aRKZUyk6Su6mFHyK9W0JF6CmG/HndD5EdnuDlZ5ky9gnR9CgwakH/yqE/9dbHuWqUO4NY+aMrMD3P/OSdBLi1LaT7PmDspDMa8S0VcC08noXs63WUfZdcsI9DtvzMEvBDSEoNacOUcPqtkgvVIOtbXI6hkecUK5urKCK93i4o78iU2kBF5TDiexZabkPoRGEv7H6FolAC/u+vLJ6dlsS97beVELl84OLOTqFY9S8DH9Qxg8+2ZsNdWmA5USNcymHBBzjM95LUYYhEZlcTMQQHByLLrdQqhmC0HCtR3RGllqsmj/Ex0GiRNvtwuEAflgCw/SoOtq87NLg6FAFjwwcF4aetPvEaB9QoDtcPuSVuFfPf9GHR9J9DOnQtn+/BHY4iJTZFeYdtH6pz8EGDGjOFSZyQYGMpiAgIeo6+Ct9/YtT66rbVqIuQx69zjAVwDAq+XZVZbvcXFWOYNWhrxnHuSCFUKKoh9gTN4ZlpR/x8PmI8vuUD4c1nXy1qvtW9mH+iWmJxEsDMN12jymR6sLnpa13L7AavRPJgXvMVdGA9jKsRv10pbr9MaFMKIuURyZ9hqhZrJcwX3kiu+9X7I1vKG9NTQiSTxmb2idk4YcyuB7yqI8+ZnALUPy4IKNI32xk4Dq841/w08USap0OCYBiVGzAZzr1tqhnzuXl2lwpXA/wJcW2BDcFOhFbupFLDO+IjkH2/RbNhBA=
X-Forefront-Antispam-Report:
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(30052699003)(82310400026)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fatwZ0/d/JEiDKLSVtiRKdt4OAXBS2rwOoRVL6cCY+7TH53MGL+lB++Qxx19ZCAcCuL4Zv/qd5TAtJaLsMHEqu6BguhZOBDXQHoiKAiCFtgoARByiVm90T1+Q0OvzIFBq8HE9wRyU26MhjG304dyOAhzAbvsv7MwaBmzrvO2gM/xMAyJGDG/ZuaExoioyBlfm/emz+Zv6S+pmGJzi6izPCLrAY5lOQFC4iXjMXD3dJa5y5k4YClmwOsjl7+kXAZfXbLyP8PwwvD/omX9zAJnNFiozeRmDQd/FcACf/R+LwAksONDfGCKtgZ0y/3HXm2zEig94QqyfXmpb28l95HswYRUFlDQ82Q9S4dFlugS8SkaxNETcUfmRmhGFNpYYkp+q5Gxy4UrJm/DtBg8ugSctoAWbGC/aeSff7eJBcArWj5lFHeyGfApY8kCAllg+Q7T
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 02:41:35.7075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a90a652-55a3-4b06-6e00-08dec5d09fca
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF538CF1BBD

This patch series adds support for the Nuvoton NAU83G60 audio codec.

The NAU83G60 is a stereo Class-D amplifier with an integrated DSP and
I/V-sense capabilities. The driver supports I2C register access through
regmap, DAPM widgets and routes, TDM interface configuration, and DSP
firmware loading.

The series is structured as follows:
- Patch 1: Adds the YAML device tree bindings documentation.
- Patch 2: Adds the ASoC codec driver implementation.

Changes in v4:
[dt-bindings]
- Refine the `firmware-name` description to clarify the loading order
 (Left then Right) and the PBTL mode behavior.
- Remove the "dsp bypass" option description.
- Update the example node to follow devicetree coding styles.


[codec driver]
- Clean up unused DSP state flags (dsp_enable, dsp_created, dsp_fws_num).
- Fixed the use of an uninitialized stack variable (`status`).
- Fixed unhandled failures in `nau8360_dsp_init()` that caused duplicated
  DAPM widgets to leak.
- Add mutex protection for PEQ memory and TDM slot caches.
- Restored the missing hardware memory access bit during suspend/resume
  to prevent PEQ coefficients from being silently lost.
- Handled `regmap_read()` failure in `nau8360_vbat_level()` to prevent
  the usage of uninitialized stack memory.
- Removed improper dynamic creation of DAPM widgets and routes within ALSA kcontrol
  `put` handlers, using proper static instantiation instead.
- Moved RX enable logic to `startup()` for consistent stream state.
- Replaced synchronous `request_firmware()` with `request_firmware_nowait()`
  to prevent deadlocks and avoid blocking the kernel during firmware I/O.
- Explicitly disable TDM RX/TX when slots or slot_width is zero.

Changes in v2/v3:
- v3: Resolved YAML build warnings, added Kconfig/Makefile entries,
  fixed stack buffer overflows in DSP parsing, and refactored TDM slot
  validation logic.
- v2: Migrated software/runtime configurations from DT properties to
  ALSA kcontrols, refactored TDM routing, and improved firmware path handling.

Neo Chang (2):
  ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
  ASoC: codecs: nau8360: Add support for NAU83G60 amplifier

 .../bindings/sound/nuvoton,nau8360.yaml       |   83 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/nau8360-dsp.c                |  707 +++++
 sound/soc/codecs/nau8360-dsp.h                |  126 +
 sound/soc/codecs/nau8360.c                    | 2499 +++++++++++++++++
 sound/soc/codecs/nau8360.h                    |  902 ++++++
 7 files changed, 4329 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8360.yaml
 create mode 100644 sound/soc/codecs/nau8360-dsp.c
 create mode 100644 sound/soc/codecs/nau8360-dsp.h
 create mode 100644 sound/soc/codecs/nau8360.c
 create mode 100644 sound/soc/codecs/nau8360.h

-- 
2.25.1

