Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793475279;
	b=ItaQewT3/U1r39rl+hRSP/I6VRqZmSVULClBwJuwLZ9CcCB/b3a9MUZW8HxiN/hlvR9Y
	 bO3DGISzKANE6e8U3x1dueyMM2OyE4f4f0RdswyC+PGE3i/621TgI0eQ5zYaMOSBEovpj
	 7+koAQ5Y32R2WT0qigecJk+NajfTQQaUHXSua8ImU4w1ksyiNqcbm2aMWKAVQ8CpZMmAG
	 hsOmluSc6W4YgK3han5gzf2s7vo9w+1V12GVAkuWVP8M5brk7oHbTeNxs6qGmv+Rq68je
	 rYWoUH2mK0bLprLNQ8FHJIGhUaj4ZCW1NpYT4JF0g8w67o68YGqRAQKGo6E4e7nI0IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793475279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WTeQ9BaGJRCMyKLIH6hVwocx7w+r9ln3q/DJI6KeoLA=;
	b=MMqNKLc4cZljIi+iYlnDX+FVVKkoxMNOaufp+zZ6VIK5ifjeYD5s2fP31fAwJMwFeCAD
	 aBkMziJ7TwAFEm3/x1y/ZlF53rI/gVhujlsb9efM9IRmdsNem5zhFG3AKgSIy/qEklxqI
	 bUS8g+n3lHAITs6c+mzU/GJFgbU8fVPvaH2onSw1BlPd9g3f9A4gln8GGzeXZ6ED4QtJC
	 wax9YNzHsDNscrYimqqXIq5to6/GFFINR3x0KNiazPQFATlBoB/geS3R3NiNDhBC0w8vT
	 bX0XtsG8uj7oNoy/tLI9UgTw3x+vwQ+ORRvMJ946/gHM5W8g/CpbUljGsLzYJoTr5uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ij466yHx;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A09606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 19:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A09606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ij466yHx
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so13738185e9.3
        for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 12:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793475277; x=1794080077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTeQ9BaGJRCMyKLIH6hVwocx7w+r9ln3q/DJI6KeoLA=;
        b=ij466yHxvuhcCu47Cx+ctSjsFELIrQ7EDZv4/vrbY99dIpn2vzxGy6Um2AgUs7bOsw
         XldaTu/fSME2mK2ATWf2nvVFs91/gHOwPpgJLGbwGZpauUkRoQ05/p4BQYgMyk3DV0BK
         pGHvcCSAFw4Ndmu9Uw+K2r1LLq3DfjPA2jk8f+6hXihk6g0hw4yGkJAg4h1STyvEIBVH
         eLT23I2Lo1f+8UxtDYM13plljhXPnHmhDXshlEIOIII3/ObWsjEEzHSM15vVxdPnYwqe
         02HK+AwjlbU4ZDH0J82p8hjhR13Wgk43RZFR9yjcfc2BbwHbJf6AUtohnAehy+OTEpmN
         YBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793475277; x=1794080077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTeQ9BaGJRCMyKLIH6hVwocx7w+r9ln3q/DJI6KeoLA=;
        b=24zH+PBDYK8n7xjVmUGS/tCq4lz5qQsR2s23/VMuKlWk6ItgqlKuCCXVZy5lygq57I
         57q9ljYnuZcpvCXU9n79Mgh/XKKeoiLZnEDYcfgnemqmhwDfhBNey7ipkhLADcJjKNES
         KgQVlit/Ad1GwG8dzqNpj3ot+mMkRjZUWK8WYofVAf2AYaQ5d5jNulYeRTjOfnWL38pi
         YEQobg8SY4Nhi53xlddR1Et41e+/hjw8uRVuQBhfQF7xFvIBgL19UBlBdAvBn2fNJvW0
         FlqP0GefIs53/F15HZmuRdD5NxmrZ1ajhdJCL2Dp+YBO4Nj8pnD92x5ATxZp3wDsKGg+
         7hwQ==
X-Gm-Message-State: AFq9FYJSY+II2mvkvUpj8Fcka8tnK9UZnAEefTlCvcIbYV9NqjfS+Dfb
	S0zNVDF0ZhBd7pE/6MPn3Q+2h0er1OLixHk2CKWA3xYhAmMy+G38C7XIyqKanQ==
X-Gm-Gg: AYBFou1VW0kFlmfEgKBDjdL2/I3STh/O1gY0pAVHc0d4xu5LS2vAgZr/3Bu6oSDFum4
	4L7Ynh62rDA5tIsBrar75BedFq225Vaf4Lik9UbOGL17+BPxMwFBn/hfDZEJgq63nILvjJrXIUH
	b79/EveQTNp9gmZeyUse66zHTTnkn+yBIIs8AFtPmQsJ4yHjKs8cnfXbx1zp5xzivD3Gs5Gs+9o
	lAVZFLl+6M9EPOPFWS07MxKmw0n20301V4WL56yJtIESTrhJbIQG/V0xBS01EwDipXg9ZoqeQEh
	ZxHJyM/W1el422j/WHW1/TxAlO2YKA54pzM3g5QJbFWYVcj3vtdz+sNfesSjXCFWKJdfAilb9g1
	DlWMb1t1DsA0xvTHjaj4nGfr3ybhqSGtvR/8PuucAJsBT6OAo5H4NWoqXQYY+a7b6U7fJ0XoZab
	FfS+/JAflzWWbu2WYNXPA7X5UVluqk/5WWDCsYIShyV13/VvtIzbQeFoybwFWubf0mMqgJa8hFD
	QxIeSMJ9aE6v9Fk45rD7CgPi8vY9YZK1si9jZ8SyWLBGr8JiVJnf6Ts/i2deytrU7fq+3RaTEXE
	6a7l2cBLXf9F5+MV8eh9hVNsq5EYZw8aVSAkVQuo6Z1z65EFfkS5wb3QXSblQtFelGCKxV5F5Za
	okrP6Xr3dhVAIu24mSgUE/9z6pw==
X-Received: by 2002:a05:600c:6211:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4ac17191046mr144883115e9.6.1793475276952;
        Sat, 31 Oct 2026 12:34:36 -0700 (PDT)
Received: from archlinux.fritz.box ([178.197.200.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e77409821sm6276363f8f.0.2026.10.31.12.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 12:34:36 -0700 (PDT)
From: Tobias Predel <tobias.predel@gmail.com>
To: linux-sound@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [BUG] ALSA: hda/intel-hdmi: silent stream verbs time out in i915 hibernation restore, ~35 s resume delay with DP monitor
Date: Sat, 31 Oct 2026 20:34:33 +0100
Message-ID: <20261031193433.6981-1-tobias.predel@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

When resuming from hibernation (S4) with an external DisplayPort monitor
that has audio connected, the i915 restore callback takes 35-37 seconds.
Function-graph tracing shows the time is spent in the Intel HDMI codec's
silent stream setup, called synchronously from the i915 modeset in
intel_audio_codec_enable(). Every HDA verb there runs into the 1 s
snd_hdac_bus_get_response() timeout, apparently because the HDA
controller (SOF, sof-audio-pci-intel-tgl) has not been restored yet when
i915 restores the display.

Booting with snd_hda_codec_intelhdmi.enable_silent_stream=N removes the
delay completely (i915 pci_pm_restore 37.2 s -> 0.15 s, same setup).

Hardware / software
-------------------
- HP Dragonfly 13.5 inch G4, BIOS V90 01.13.01 (07/08/2026)
- Intel Core i7-1355U (Raptor Lake-P), Iris Xe (i915)
- Audio: SOF (sof-audio-pci-intel-tgl, firmware 2:2:0-57864,
  topology sof-hda-generic-2ch.tplg), codecs Realtek ALC245
  (0x10ec0245) and Intel Raptor Lake P HDMI (0x8086281f)
- External monitor Philips 499P9 (DP audio sink) on DP-3 via a USB-C
  dock, internal eDP panel also enabled
- Kernel 7.2.11-arch1-1 (Arch Linux), sof-firmware 2026.09.2,
  linux-firmware 20260916
- Hibernation to swap file, HibernateMode=shutdown, i915 loaded in the
  initramfs (so the boot kernel also drives the display before the
  image is restored)

Reproduce
---------
1. Connect an external DP monitor with audio (here via a USB-C dock).
2. echo 1 > /sys/power/pm_print_times
3. systemctl hibernate, then power on and resume.
4. dmesg shows:

   i915 0000:00:02.0: PM: pci_pm_restore returned 0 after 37218199 usecs
   PM: restore of devices complete after 37332.666 msecs

   During that time the log is silent. Undocked (eDP only) the same
   restore takes ~0.37 s. Reproduced in 4 docked runs (35.2, 37.2, 37.2 and
   35.2 s).

Function graph trace
--------------------
Traced with set_graph_function=i915_pm_restore, tracing_thresh=100000
(only calls > 100 ms are recorded). Outer frames:

  i915_pm_restore                                 35210108 us
   i915_drm_resume                                35210106 us
    intel_display_driver_resume                   35180739 us
     __intel_display_driver_resume                35180587 us
      drm_atomic_helper_commit_duplicated_state   35179346 us
       drm_atomic_commit / intel_atomic_commit    35178967 us
        intel_atomic_commit_tail                  35178583 us
         intel_audio_codec_enable                 35072636 us
          intel_pin_eld_notify                    35058094 us
           snd_hda_hdmi_check_presence_and_report 35058092 us
            hdmi_present_sense                    35058089 us
             i915_set_silent_stream               28046897 us
              silent_stream_enable_i915           26043572 us
               snd_hda_hdmi_setup_audio_infoframe 22037032 us
                hdmi_pin_setup_infoframe          17028844 us
              silent_stream_set_kae                2003323 us
             i915_pin_cvt_fixup                    5008097 us
             haswell_verify_D0                     2003183 us
             snd_hda_codec_setup_stream            2003042 us

All leaf entries are snd_hdac_bus_get_response() taking ~1001 ms each,
35 in total (e.g. via codec_exec_verb, snd_hda_set_dev_select,
snd_hdac_check_power_state, hdmi_set_channel_count). In the PM log the
SOF controller's own restore completes later:

  sof-audio-pci-intel-tgl 0000:00:1f.3: PM: pci_pm_restore returned 0
  after 111423 usecs

With enable_silent_stream=N the trace shows no audio calls over 100 ms
and i915_pm_restore finishes in 145 ms.

Restore ordering (pm_print_times, attached run)
-----------------------------------------------
The SOF controller's restore is only called after i915's restore has
returned, so the HDMI codec is driven from i915's restore while its
controller is still suspended:

  [393.842119] i915 0000:00:02.0: PM: calling pci_pm_restore
  [429.058162] i915 0000:00:02.0: PM: pci_pm_restore returned 0 after 35217884 usecs
  [429.058191] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: calling pci_pm_restore
  [429.470283] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: pci_pm_restore returned 0 after 412096 usecs
  [429.470356] snd_hda_codec_intelhdmi ehdaudio0D2: PM: calling hda_codec_pm_restore

Logs
----
Appended at the end of this mail:
- the function_graph trace of the run above (set_graph_function=
  i915_pm_restore, tracing_thresh=100000, funcgraph-tail); it contains
  35 snd_hdac_bus_get_response() calls of ~1 s each
- the PM part of dmesg of the same run (pm_print_times=1, filtered to
  phase summaries, calls over 1 ms and the i915/SOF/HDMI codec restore
  calls). The full dmesg is available on request.

Notes
-----
- Changing enable_silent_stream at runtime has no effect; it is
  evaluated at codec probe, so a reboot (or codec rebind) is needed.
- I have not tested whether s2idle resume with the dock has the same
  problem.
- I assume the i915 audio notify needs to be deferred until the HDA
  controller is resumed, or the silent stream setup should be skipped
  or postponed while the codec/controller is still suspended, but I
  don't know the intended ordering between i915 and the HDA/SOF device
  across hibernation restore.

I can capture more traces or test patches on this machine.

Thanks,
Tobias Predel

--- function_graph trace (i915_pm_restore, threshold 100 ms) ---

# tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
  6) $ 1000291 us  |                                          } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1000343 us  |                                        } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1000348 us  |                                      } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1000349 us  |                                    } /* snd_hdac_exec_verb [snd_hda_core] */
  6) $ 1000351 us  |                                  } /* hda_reg_read [snd_hda_core] */
  6) $ 1000353 us  |                                } /* snd_hdac_regmap_read_raw_uncached [snd_hda_core] */
  6) $ 1000353 us  |                              } /* snd_hdac_read_parm_uncached [snd_hda_core] */
  6) $ 1000355 us  |                            } /* snd_hda_get_num_devices [snd_hda_codec] */
  6) $ 1000355 us  |                          } /* snd_hda_set_dev_select [snd_hda_codec] */
  6) $ 1001987 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1002018 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1002026 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1002027 us  |                                  } /* snd_hdac_exec_verb [snd_hda_core] */
  6) $ 1002031 us  |                                } /* hda_reg_write [snd_hda_core] */
  6) $ 1002042 us  |                              } /* _regmap_write */
  6) $ 1002045 us  |                            } /* regmap_write */
  6) $ 1002047 us  |                          } /* snd_hdac_regmap_write_raw [snd_hda_core] */
  6) $ 1001918 us  |                                    } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001951 us  |                                  } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001960 us  |                                } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001962 us  |                              } /* snd_hdac_check_power_state [snd_hda_core] */
  6) $ 1001782 us  |                                    } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001815 us  |                                  } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001824 us  |                                } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001825 us  |                              } /* snd_hdac_check_power_state [snd_hda_core] */
  6) $ 2003791 us  |                            } /* haswell_verify_D0 [snd_hda_codec_intelhdmi] */
  6) $ 1001902 us  |                                            } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001931 us  |                                          } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001937 us  |                                        } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001938 us  |                                      } /* snd_hdac_exec_verb [snd_hda_core] */
  6) $ 1001941 us  |                                    } /* hda_reg_read [snd_hda_core] */
  6) $ 1001943 us  |                                  } /* snd_hdac_regmap_read_raw_uncached [snd_hda_core] */
  6) $ 1001944 us  |                                } /* snd_hdac_read_parm_uncached [snd_hda_core] */
  6) $ 1001946 us  |                              } /* snd_hda_get_num_devices [snd_hda_codec] */
  6) $ 1001948 us  |                            } /* snd_hda_set_dev_select [snd_hda_codec] */
  6) $ 1001893 us  |                                  } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001924 us  |                                } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001931 us  |                              } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001933 us  |                            } /* snd_hdac_codec_read [snd_hda_core] */
  6) $ 1001987 us  |                                          } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1002019 us  |                                        } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1002028 us  |                                      } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1002029 us  |                                    } /* snd_hdac_exec_verb [snd_hda_core] */
  6) $ 1002033 us  |                                  } /* hda_reg_write [snd_hda_core] */
  6) $ 1002044 us  |                                } /* _regmap_write */
  6) $ 1002048 us  |                              } /* regmap_write */
  6) $ 1002051 us  |                            } /* snd_hdac_regmap_write_raw [snd_hda_core] */
  6) $ 5009734 us  |                          } /* i915_pin_cvt_fixup [snd_hda_codec_intelhdmi] */
  6) $ 1001733 us  |                                      } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001765 us  |                                    } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001773 us  |                                  } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001775 us  |                                } /* snd_hdac_codec_read [snd_hda_core] */
  6) $ 1001903 us  |                                      } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001932 us  |                                    } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001938 us  |                                  } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001939 us  |                                } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 2003720 us  |                              } /* snd_hda_codec_setup_stream [snd_hda_codec] */
  6) $ 1001684 us  |                                      } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001712 us  |                                    } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001717 us  |                                  } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001718 us  |                                } /* snd_hdac_codec_read [snd_hda_core] */
  5) $ 1001910 us  |                                      } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001938 us  |                                    } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001943 us  |                                  } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001944 us  |                                } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 2003666 us  |                              } /* snd_hda_codec_setup_stream [snd_hda_codec] */
  5) $ 1001905 us  |                                                } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001933 us  |                                              } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001938 us  |                                            } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001938 us  |                                          } /* snd_hdac_exec_verb [snd_hda_core] */
  5) $ 1001941 us  |                                        } /* hda_reg_read [snd_hda_core] */
  5) $ 1001943 us  |                                      } /* snd_hdac_regmap_read_raw_uncached [snd_hda_core] */
  5) $ 1001944 us  |                                    } /* snd_hdac_read_parm_uncached [snd_hda_core] */
  5) $ 1001945 us  |                                  } /* snd_hda_get_num_devices [snd_hda_codec] */
  5) $ 1001946 us  |                                } /* snd_hda_set_dev_select [snd_hda_codec] */
  5) $ 1001912 us  |                                      } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001939 us  |                                    } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001944 us  |                                  } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001945 us  |                                } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001909 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001936 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001941 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001943 us  |                                  } /* snd_hdac_codec_read [snd_hda_core] */
  6) $ 1001917 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001945 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001950 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001951 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 2003895 us  |                                } /* hdmi_set_channel_count [snd_hda_core] */
  6) $ 1001906 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001934 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001939 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001940 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001941 us  |                                } /* snd_hdac_setup_channel_mapping [snd_hda_core] */
  6) $ 1001910 us  |                                                  } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001937 us  |                                                } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001942 us  |                                              } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001943 us  |                                            } /* snd_hdac_exec_verb [snd_hda_core] */
  6) $ 1001945 us  |                                          } /* hda_reg_read [snd_hda_core] */
  6) $ 1001947 us  |                                        } /* snd_hdac_regmap_read_raw_uncached [snd_hda_core] */
  6) $ 1001949 us  |                                      } /* snd_hdac_read_parm_uncached [snd_hda_core] */
  6) $ 1001950 us  |                                    } /* snd_hda_get_num_devices [snd_hda_codec] */
  6) $ 1001951 us  |                                  } /* snd_hda_set_dev_select [snd_hda_codec] */
  6) $ 1001919 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001946 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001952 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001953 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001900 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001927 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001932 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001933 us  |                                  } /* snd_hdac_codec_read [snd_hda_core] */
  6) $ 1001913 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001940 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001945 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001946 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001912 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001939 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001944 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001945 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001916 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001943 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001948 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001949 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1002078 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1002109 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1002119 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1002120 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001734 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001768 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001779 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001780 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1002068 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1002101 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1002110 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1002111 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001846 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001879 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001889 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001890 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001922 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001957 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001968 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001970 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 1001765 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001799 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001810 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001811 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001903 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001932 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001939 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001940 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001910 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001938 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001943 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001943 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001921 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001949 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001954 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001954 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001915 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001942 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001948 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001948 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 1001915 us  |                                        } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001942 us  |                                      } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001947 us  |                                    } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001948 us  |                                  } /* snd_hdac_codec_write [snd_hda_core] */
  6) $ 17033117 us |                                } /* hdmi_pin_setup_infoframe [snd_hda_codec_hdmi] */
  6) $ 22042853 us |                              } /* snd_hda_hdmi_setup_audio_infoframe [snd_hda_codec_hdmi] */
  6) $ 26050519 us |                            } /* silent_stream_enable_i915 [snd_hda_codec_intelhdmi] */
  6) $ 1001914 us  |                                    } /* snd_hdac_bus_get_response [snd_hda_core] */
  6) $ 1001941 us  |                                  } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  6) $ 1001946 us  |                                } /* codec_exec_verb [snd_hda_codec] */
  6) $ 1001948 us  |                              } /* snd_hdac_codec_read [snd_hda_core] */
  5) $ 1001905 us  |                                    } /* snd_hdac_bus_get_response [snd_hda_core] */
  5) $ 1001932 us  |                                  } /* snd_hdac_bus_exec_verb_unlocked [snd_hda_core] */
  5) $ 1001937 us  |                                } /* codec_exec_verb [snd_hda_codec] */
  5) $ 1001938 us  |                              } /* snd_hdac_codec_write [snd_hda_core] */
  5) $ 2003888 us  |                            } /* silent_stream_set_kae [snd_hda_codec_intelhdmi] */
  5) $ 28054411 us |                          } /* i915_set_silent_stream [snd_hda_codec_intelhdmi] */
  5) $ 35066577 us |                        } /* hdmi_present_sense [snd_hda_codec_hdmi] */
  5) $ 35066580 us |                      } /* snd_hda_hdmi_check_presence_and_report [snd_hda_codec_hdmi] */
  5) $ 35066583 us |                    } /* intel_pin_eld_notify [snd_hda_codec_intelhdmi] */
  5) $ 35080698 us |                  } /* intel_audio_codec_enable [i915] */
  2) $ 35185919 us |                } /* intel_atomic_commit_tail [i915] */
  2) $ 35186337 us |              } /* intel_atomic_commit [i915] */
  2) $ 35186627 us |            } /* drm_atomic_commit */
  2) $ 35186628 us |          } /* drm_atomic_helper_commit_duplicated_state */
  2) $ 35187434 us |        } /* __intel_display_driver_resume [i915] */
  2) $ 35187590 us |      } /* intel_display_driver_resume [i915] */
  2) $ 35216027 us |    } /* i915_drm_resume [i915] */
  2) $ 35216028 us |  } /* i915_pm_restore [i915] */

--- dmesg excerpt (PM, pm_print_times=1) ---

[  385.597875] PM: hibernation: hibernation entry
[  385.675215] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x00000fff]
[  385.675217] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000fffff]
[  385.675219] PM: hibernation: Marking nosave pages: [mem 0x410a7000-0x4111cfff]
[  385.675222] PM: hibernation: Marking nosave pages: [mem 0x4d8ab000-0x53bfefff]
[  385.675638] PM: hibernation: Marking nosave pages: [mem 0x53c00000-0xffffffff]
[  385.675972] PM: hibernation: Basic memory bitmaps created
[  385.730889] PM: hibernation: Preallocating image memory
[  391.393882] PM: hibernation: Allocated 1013461 pages for snapshot
[  391.393888] PM: hibernation: Allocated 4053844 kbytes in 5.66 seconds (716.22 MB/s)
[  391.414330] usb usb1: PM: usb_dev_freeze returned 0 after 15370 usecs
[  391.419080] usb usb4: PM: usb_dev_freeze returned 0 after 20841 usecs
[  391.435223] usb usb2: PM: usb_dev_freeze returned 0 after 36470 usecs
[  391.443649] leds hda::micmute: PM: led_suspend returned 0 after 43365 usecs
[  391.446314] i2c_hid_acpi i2c-SYNA310F:00: PM: acpi_subsys_freeze returned 0 after 2015 usecs
[  391.450329] ieee80211 phy0: PM: wiphy_suspend [cfg80211] returned 0 after 6055 usecs
[  391.459706] snd_hda_codec_alc269 ehdaudio0D0: PM: hda_codec_pm_freeze [snd_hda_codec] returned 0 after 15586 usecs
[  391.462576] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: PM: cs35l41_system_suspend [snd_hda_scodec_cs35l41] returned 0 after 2293 usecs
[  391.463684] hi556 i2c-INT3537:00: PM: acpi_subsys_freeze returned 0 after 18549 usecs
[  391.488579] nvme 0000:02:00.0: PM: pci_pm_freeze returned 0 after 24125 usecs
[  391.527435] mtk_t7xx 0000:57:00.0: PM: pci_pm_freeze returned 0 after 82328 usecs
[  391.534857] tpm_tis IFX1522:00: PM: acpi_subsys_freeze returned 0 after 68955 usecs
[  391.538757] intel-hid INTC1078:00: PM: acpi_subsys_freeze returned 0 after 3857 usecs
[  391.603542] r8152-cfgselector 3-2.1.2: PM: usb_dev_freeze returned 0 after 203367 usecs
[  391.615386] usb usb3: PM: usb_dev_freeze returned 0 after 10527 usecs
[  393.502223] i915 0000:00:02.0: PM: pci_pm_freeze returned 0 after 2041477 usecs
[  393.505533] mei_me 0000:00:16.0: PM: pci_pm_freeze returned 0 after 3181 usecs
[  393.507588] i915 0000:00:02.0: PM: calling i915_pm_freeze_late [i915] @ 228, parent: pci0000:00
[  393.523756] i915 0000:00:02.0: PM: i915_pm_freeze_late [i915] returned 0 after 15873 usecs
[  393.531869] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: pci_pm_freeze_noirq returned 0 after 5206 usecs
[  393.536400] xhci_hcd 0000:00:14.0: PM: pci_pm_freeze_noirq returned 0 after 9390 usecs
[  393.537623] iwlwifi 0000:00:14.3: PM: pci_pm_freeze_noirq returned 0 after 10905 usecs
[  393.537686] intel-lpss 0000:00:19.0: PM: pci_pm_freeze_noirq returned 0 after 9653 usecs
[  393.537837] intel-lpss 0000:00:1e.0: PM: pci_pm_freeze_noirq returned 0 after 9804 usecs
[  393.537860] mei_me 0000:00:16.0: PM: pci_pm_freeze_noirq returned 0 after 9979 usecs
[  393.537912] pcieport 0000:00:07.2: PM: pci_pm_freeze_noirq returned 0 after 10379 usecs
[  393.537925] pcieport 0000:00:07.0: PM: pci_pm_freeze_noirq returned 0 after 10358 usecs
[  393.537941] i801_smbus 0000:00:1f.4: PM: pci_pm_freeze_noirq returned 0 after 10120 usecs
[  393.537945] intel-lpss 0000:00:15.1: PM: pci_pm_freeze_noirq returned 0 after 6954 usecs
[  393.537958] intel-lpss 0000:00:15.0: PM: pci_pm_freeze_noirq returned 0 after 6988 usecs
[  393.537969] intel-lpss 0000:00:10.1: PM: pci_pm_freeze_noirq returned 0 after 3023 usecs
[  393.538043] mtk_t7xx 0000:57:00.0: PM: pci_pm_freeze_noirq returned 0 after 10526 usecs
[  393.538046] intel_vsec 0000:00:0a.0: PM: pci_pm_freeze_noirq returned 0 after 3383 usecs
[  393.538051] nvme 0000:02:00.0: PM: pci_pm_freeze_noirq returned 0 after 7053 usecs
[  393.538054] intel-lpss 0000:00:10.0: PM: pci_pm_freeze_noirq returned 0 after 10077 usecs
[  393.538101] i915 0000:00:02.0: PM: pci_pm_freeze_noirq returned 0 after 6156 usecs
[  393.538219] intel-spi 0000:00:1f.5: PM: pci_pm_freeze_noirq returned 0 after 4207 usecs
[  393.541780] tigerlake-pinctrl INTC1055:00: PM: intel_pinctrl_suspend_noirq returned 0 after 13106 usecs
[  393.543050] pci 0000:00:1f.0: PM: pci_pm_freeze_noirq returned 0 after 1043 usecs
[  393.543323] intel-lpss 0000:00:1e.2: PM: pci_pm_freeze_noirq returned 0 after 1303 usecs
[  393.543497] pci 0000:00:08.0: PM: pci_pm_freeze_noirq returned 0 after 1388 usecs
[  393.543505] igen6_edac 0000:00:00.0: PM: pci_pm_freeze_noirq returned 0 after 1090 usecs
[  393.543509] proc_thermal_pci 0000:00:04.0: PM: pci_pm_freeze_noirq returned 0 after 1209 usecs
[  393.543509] pci 0000:00:05.0: PM: pci_pm_freeze_noirq returned 0 after 1306 usecs
[  393.543854] pcieport 0000:00:1c.0: PM: pci_pm_freeze_noirq returned 0 after 1825 usecs
[  393.543874] pcieport 0000:00:06.2: PM: pci_pm_freeze_noirq returned 0 after 1793 usecs
[  393.544000] pcieport 0000:00:06.0: PM: pci_pm_freeze_noirq returned 0 after 1953 usecs
[  394.355989] PM: hibernation: Normal pages needed: 974181 + 1024, available pages: 7302451
[  393.696790] i915 0000:00:02.0: PM: calling pci_pm_restore_noirq @ 410, parent: pci0000:00
[  393.698223] pcieport 0000:00:06.0: PM: pci_pm_restore_noirq returned 0 after 1337 usecs
[  393.698244] pcieport 0000:00:06.2: PM: pci_pm_restore_noirq returned 0 after 1299 usecs
[  393.698316] xhci_hcd 0000:00:0d.0: PM: pci_pm_restore_noirq returned 0 after 1193 usecs
[  393.698435] intel-lpss 0000:00:10.1: PM: pci_pm_restore_noirq returned 0 after 1186 usecs
[  393.699066] i801_smbus 0000:00:1f.4: PM: pci_pm_restore_noirq returned 0 after 1301 usecs
[  393.699503] xhci_hcd 0000:00:14.0: PM: pci_pm_restore_noirq returned 0 after 2153 usecs
[  393.699544] intel-lpss 0000:00:15.0: PM: pci_pm_restore_noirq returned 0 after 2126 usecs
[  393.699558] intel-lpss 0000:00:19.0: PM: pci_pm_restore_noirq returned 0 after 2059 usecs
[  393.699568] intel-lpss 0000:00:15.1: PM: pci_pm_restore_noirq returned 0 after 2133 usecs
[  393.699773] intel-lpss 0000:00:1e.2: PM: pci_pm_restore_noirq returned 0 after 2151 usecs
[  393.699827] intel-lpss 0000:00:1e.0: PM: pci_pm_restore_noirq returned 0 after 2261 usecs
[  393.700032] nvme 0000:02:00.0: PM: pci_pm_restore_noirq returned 0 after 1762 usecs
[  393.700053] i915 0000:00:02.0: PM: pci_pm_restore_noirq returned 0 after 3249 usecs
[  393.700066] pcieport 0000:00:1c.0: PM: pci_pm_restore_noirq returned 0 after 2568 usecs
[  393.700173] iwlwifi 0000:00:14.3: PM: pci_pm_restore_noirq returned 0 after 2757 usecs
[  393.700475] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: calling pci_pm_restore_noirq @ 14, parent: pci0000:00
[  393.706375] tigerlake-pinctrl INTC1055:00: PM: intel_pinctrl_resume_noirq returned 0 after 5743 usecs
[  393.711161] thunderbolt 0000:00:0d.2: PM: pci_pm_restore_noirq returned 0 after 14039 usecs
[  393.711162] thunderbolt 0000:00:0d.3: PM: pci_pm_restore_noirq returned 0 after 13989 usecs
[  393.712409] i915 0000:00:02.0: PM: calling i915_pm_restore_early [i915] @ 14, parent: pci0000:00
[  393.717850] i915 0000:00:02.0: PM: i915_pm_restore_early [i915] returned 0 after 5248 usecs
[  393.842119] i915 0000:00:02.0: PM: calling pci_pm_restore @ 412, parent: pci0000:00
[  393.845562] mtk_t7xx 0000:57:00.0: PM: pci_pm_restore returned 0 after 2792 usecs
[  393.845639] xhci_hcd 0000:00:0d.0: PM: pci_pm_restore returned 0 after 3235 usecs
[  393.845673] xhci_hcd 0000:00:14.0: PM: pci_pm_restore returned 0 after 3222 usecs
[  393.846605] proc_thermal_pci 0000:00:04.0: PM: pci_pm_restore returned 0 after 4459 usecs
[  393.846802] acpi-battery PNP0C0A:00: PM: acpi_battery_resume returned 0 after 4140 usecs
[  393.864978] mei_me 0000:00:16.0: PM: pci_pm_restore returned 0 after 22434 usecs
[  393.867756] usb usb1: PM: usb_dev_restore returned 0 after 22090 usecs
[  393.872731] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: PM: cs35l41_system_resume [snd_hda_scodec_cs35l41] returned 0 after 7539 usecs
[  393.879291] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.1: PM: cs35l41_system_resume [snd_hda_scodec_cs35l41] returned 0 after 6396 usecs
[  393.887133] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.2: PM: cs35l41_system_resume [snd_hda_scodec_cs35l41] returned 0 after 7651 usecs
[  393.908810] i2c_hid_acpi i2c-ELAN2513:00: PM: i2c_hid_core_pm_restore [i2c_hid] returned 0 after 66001 usecs
[  393.910685] i2c_hid_acpi i2c-SYNA310F:00: PM: i2c_hid_core_pm_restore [i2c_hid] returned 0 after 67873 usecs
[  393.920510] hp-wmi hp-wmi: PM: platform_pm_restore returned 0 after 33257 usecs
[  393.928670] cs35l41-hda spi1-CSC3551:00-cs35l41-hda.3: PM: cs35l41_system_resume [snd_hda_scodec_cs35l41] returned 0 after 8128 usecs
[  393.940156] iwlwifi 0000:00:14.3: PM: pci_pm_restore returned 0 after 97635 usecs
[  393.950842] usb usb2: PM: usb_dev_restore returned 0 after 105154 usecs
[  393.950906] usb usb4: PM: usb_dev_restore returned 0 after 105193 usecs
[  393.982783] usb usb3: PM: usb_dev_restore returned 0 after 137077 usecs
[  394.214258] ieee80211 phy0: PM: wiphy_resume [cfg80211] returned 0 after 274007 usecs
[  394.344541] usb 3-2: PM: usb_dev_restore returned 0 after 361727 usecs
[  394.478666] usb 3-10: PM: usb_dev_restore returned 0 after 495852 usecs
[  395.574828] usb 3-2.1: PM: usb_dev_restore returned 0 after 1230071 usecs
[  395.809482] r8152-cfgselector 3-2.1.2: PM: usb_dev_restore returned 0 after 234522 usecs
[  429.058162] i915 0000:00:02.0: PM: pci_pm_restore returned 0 after 35217884 usecs
[  429.058191] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: calling pci_pm_restore @ 97, parent: pci0000:00
[  429.470283] sof-audio-pci-intel-tgl 0000:00:1f.3: PM: pci_pm_restore returned 0 after 412096 usecs
[  429.470356] snd_hda_codec_intelhdmi ehdaudio0D2: PM: calling hda_codec_pm_restore [snd_hda_codec] @ 97, parent: 0000:00:1f.3
[  429.475831] PM: hibernation: Basic memory bitmaps freed
[  429.476751] Restarting tasks: Starting
[  429.478028] Restarting tasks: Done
[  429.556948] PM: hibernation: hibernation exit
